import "widgets";
import Calendar from '@toast-ui/calendar';
import '@toast-ui/calendar/dist/toastui-calendar.min.css';
import "tui-date-picker/dist/tui-date-picker.css";
import "tui-time-picker/dist/tui-time-picker.css";
import dayjs from "dayjs";

import { ProxyCalendar } from "../modules/proxy-calendar";

import { formatDateNav, addNavigation } from "../modules/calendar-utils";

HTMLWidgets.widget({
  name: "calendar",

  type: "output",

  factory: function (el, width, height) {
    var cal,
      renderRange,
      formatNav = "YYYY-MM-DD",
      navigationOptions;

    return {
      renderValue: function (x) {
        var menu = document.getElementById(el.id + "_menu");

        if (typeof cal !== "undefined") {
          cal.destroy();
          el.innerHTML = "";
        }

        var options = x.options;

        cal = new Calendar(el, options);
        var schd = x.schedules;
        cal.createEvents(schd);
        if (x.hasOwnProperty("defaultDate")) {
          cal.setDate(x.defaultDate);
        }

        addNavigation(cal, el.id, x.navigationOptions);
        navigationOptions = x.navigationOptions;
        // Navigation buttons
        if (!x.navigation) {
          menu.style.display = "none";
        }

        if (x.events.hasOwnProperty("beforeCreateSchedule")) {
          if (x.events.beforeCreateSchedule === "auto") {
            cal.on("beforeCreateEvent", function (event) {
              cal.createEvents([
                {
                  title: event.title,
                  location: event.location,
                  start: dayjs(event.start).format(),
                  end: dayjs(event.end).format(),
                  isAllday: event.isAllday,
                  category: event.isAllday ? "allday" : "time",
                  calendarId: event.calendarId,
                },
              ]);
            });
          } else {
            cal.on("beforeCreateEvent", x.events.beforeCreateSchedule);
          }
        } else if (HTMLWidgets.shinyMode) {
          cal.on("beforeCreateEvent", function (event) {
            //console.log(event);
            Shiny.setInputValue(el.id + "_add", {
              title: event.title,
              location: event.location,
              start: dayjs(event.start).format(),
              end: dayjs(event.end).format(),
              isAllday: event.isAllday,
              category: event.isAllday ? "allday" : "time",
              calendarId: event.calendarId,
            }, {priority: "event"});
          }, {priority: "event"});
        }

        if (x.events.hasOwnProperty("afterRenderSchedule")) {
          cal.on("afterRenderEvent", x.events.afterRenderSchedule);
        } else if (HTMLWidgets.shinyMode) {
          cal.on("afterRenderEvent", function (event) {
            var events = cal.getEvent(event.id, event.calendarId);
            Shiny.setInputValue(el.id + "_schedules", events, {priority: "event"});
          });
        }

        if (x.events.hasOwnProperty("clickSchedule")) {
          cal.on("clickEvent", x.events.clickSchedule);
        } else if (HTMLWidgets.shinyMode) {
          cal.on("clickEvent", function (obj) {
            var schedule = obj.event;
            schedule = cal.getEvent(schedule.id, schedule.calendarId);
            Shiny.setInputValue(el.id + "_click", schedule, {priority: "event"});
          });
        }

        if (x.events.hasOwnProperty("beforeDeleteSchedule")) {
          cal.on("beforeDeleteEvent", x.events.beforeDeleteSchedule);
        } else if (HTMLWidgets.shinyMode) {
          cal.on("beforeDeleteEvent", function (eventObj) {
            var event = cal.getEvent(eventObj.id, eventObj.calendarId);
            Shiny.setInputValue(el.id + "_delete", {
              id: event.id,
              title: event.title,
              location: event.location,
              start: dayjs(event.start).format(),
              end: dayjs(event.end).format(),
              isAllday: event.isAllday,
              category: event.isAllday ? "allday" : "time",
              calendarId: event.calendarId,
            }, {priority: "event"});
          });
        }

        if (x.events.hasOwnProperty("beforeUpdateSchedule")) {
          cal.on("beforeUpdateEvent", x.events.beforeUpdateSchedule);
        } else if (HTMLWidgets.shinyMode) {
          cal.on("beforeUpdateEvent", function (updatedEventInfo) {
            var event = updatedEventInfo.event;
            event = cal.getEvent(event.id, event.calendarId);
            var changes = updatedEventInfo.changes;
            //cal.updateSchedule(schedule.id, schedule.calendarId, changes);
            if (changes.hasOwnProperty("end")) {
              changes.end = dayjs(changes.end).format();
            }
            if (changes.hasOwnProperty("start")) {
              changes.start = dayjs(changes.start).format();
            }
            Shiny.setInputValue(el.id + "_update", {
              schedule: {
                id: event.id,
                title: event.title,
                location: event.location,
                start: dayjs(event.start).format(),
                end: dayjs(event.end).format(),
                isAllday: event.isAllday,
                category: event.isAllday ? "allday" : "time",
                calendarId: event.calendarId,
              },
              changes: changes,
            }, {priority: "event"});
          });
        }

        if (x.events.hasOwnProperty("clickDayname")) {
          cal.on("clickDayname", x.events.clickDayname);
        }

        if (x.events.hasOwnProperty("clickMorecalendar")) {
          cal.on("clickMoreEventsBtn", x.events.clickMorecalendar);
        }

        if (x.events.hasOwnProperty("clickTimezonesCollapseBtncalendar")) {
          cal.on(
            "clickTimezoneCollapseBtn",
            x.events.clickTimezonesCollapseBtncalendar
          );
        }

        if (HTMLWidgets.shinyMode) {
          Shiny.setInputValue(el.id + "_dates", {
            current: dayjs(cal.getDate()).format(),
            start: dayjs(cal.getDateRangeStart()).format(),
            end: dayjs(cal.getDateRangeEnd()).format(),
          }, {priority: "event"});
        }
      },

      getWidget: function () {
        return cal;
      },

      getNavOptions: function() {
        return navigationOptions;
      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      },
    };
  },
});

ProxyCalendar();
