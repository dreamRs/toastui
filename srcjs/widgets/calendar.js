import 'widgets';
import Calendar from 'tui-calendar';
import "tui-calendar/dist/tui-calendar.css";
import 'tui-date-picker/dist/tui-date-picker.css';
import 'tui-time-picker/dist/tui-time-picker.css';
import moment from 'moment';

import { ProxyCalendar } from '../modules/proxy-calendar';

HTMLWidgets.widget({
  name: "calendar",

  type: "output",

  factory: function(el, width, height) {
    var cal,
      renderRange,
      formatNav = "YYYY-MM-DD";

    return {
      renderValue: function(x) {
        var menu = document.getElementById(el.id + "_menu");

        if (!x.useNav) {
          if (menu !== null) {
            menu.parentNode.removeChild(menu);
          }
        }

        if (typeof cal !== "undefined") {
          cal.destroy();
          el.innerHTML = "";
        }

        var options = x.options;

        cal = new Calendar(el, options);
        var schd = x.schedules;
        cal.createSchedules(schd);
        if (x.hasOwnProperty("defaultDate")) {
          cal.setDate(x.defaultDate);
        }

        // Navigation button
        if (x.useNav) {
          formatNav = x.bttnOpts.fmt_date;
          renderRange = document.getElementById(el.id + "_renderRange");
          renderRange.innerHTML =
            moment(cal.getDateRangeStart()._date).format(formatNav) +
            " - " +
            moment(cal.getDateRangeEnd()._date).format(formatNav);

          var prev = document.getElementById(el.id + "_prev");
          prev.className += x.bttnOpts.class;
          prev.innerHTML = x.bttnOpts.prev_label;
          //var clickPrevEvent = clickPrev(cal, renderRange);
          prev.removeEventListener("click", this.clickPrev);
          prev.addEventListener("click", this.clickPrev);

          var next = document.getElementById(el.id + "_next");
          next.className += x.bttnOpts.class;
          next.innerHTML = x.bttnOpts.next_label;
          //var clickNextEvent = clickNext(cal, renderRange);
          next.removeEventListener("click", this.clickNext);
          next.addEventListener("click", this.clickNext);

          var today = document.getElementById(el.id + "_today");
          today.className += x.bttnOpts.class;
          today.innerHTML = x.bttnOpts.today_label;
          //var clickTodayEvent = clickToday(cal, renderRange);
          today.removeEventListener("click", this.clickToday);
          today.addEventListener("click", this.clickToday);

          if (x.bttnOpts.hasOwnProperty("bg")) {
            prev.style.background = x.bttnOpts.bg;
            next.style.background = x.bttnOpts.bg;
            today.style.background = x.bttnOpts.bg;
          }
          if (x.bttnOpts.hasOwnProperty("color")) {
            prev.style.color = x.bttnOpts.color;
            next.style.color = x.bttnOpts.color;
            today.style.color = x.bttnOpts.color;
          }
        }

        if (x.events.hasOwnProperty("beforeCreateSchedule")) {
          if (x.events.beforeCreateSchedule === "auto") {
            cal.on("beforeCreateSchedule", function(event) {
              cal.createSchedules([{
                title: event.title,
                location: event.location,
                start: moment(event.start._date).format(),
                end: moment(event.end._date).format(),
                isAllDay: event.isAllDay,
                category: event.isAllDay ? "allday" : "time",
                calendarId: event.calendarId
              }]);
            });
          } else {
            cal.on("beforeCreateSchedule", x.events.beforeCreateSchedule);
          }
        } else if (HTMLWidgets.shinyMode) {
          cal.on("beforeCreateSchedule", function(event) {
            //console.log(event);
            Shiny.setInputValue(el.id + "_add", {
              title: event.title,
              location: event.location,
              start: moment(event.start._date).format(),
              end: moment(event.end._date).format(),
              isAllDay: event.isAllDay,
              category: event.isAllDay ? "allday" : "time",
              calendarId: event.calendarId
            });
          });
        }

        if (x.events.hasOwnProperty("afterRenderSchedule")) {
          cal.on("afterRenderSchedule", x.events.afterRenderSchedule);
        } else if (HTMLWidgets.shinyMode) {
          cal.on("afterRenderSchedule", function(event) {
            var schedule = event.schedule;
            schedule = cal.getSchedule(schedule.id, schedule.calendarId);
            Shiny.setInputValue(el.id + "_schedules", schedule);
          });
        }

        if (x.events.hasOwnProperty("clickSchedule")) {
          cal.on("clickSchedule", x.events.clickSchedule);
        } else if (HTMLWidgets.shinyMode) {
          cal.on("clickSchedule", function(event) {
            var schedule = event.schedule;
            schedule = cal.getSchedule(schedule.id, schedule.calendarId);
            Shiny.setInputValue(el.id + "_click", schedule);
          });
        }

        if (x.events.hasOwnProperty("beforeDeleteSchedule")) {
          cal.on("beforeDeleteSchedule", x.events.beforeDeleteSchedule);
        } else if (HTMLWidgets.shinyMode) {
          cal.on("beforeDeleteSchedule", function(event) {
            var schedule = event.schedule;
            schedule = cal.getSchedule(schedule.id, schedule.calendarId);
            Shiny.setInputValue(el.id + "_delete", {
              id: schedule.id,
              title: schedule.title,
              location: schedule.location,
              start: moment(schedule.start._date).format(),
              end: moment(schedule.end._date).format(),
              isAllDay: schedule.isAllDay,
              category: schedule.isAllDay ? "allday" : "time",
              calendarId: schedule.calendarId
            });
          });
        }

        if (x.events.hasOwnProperty("beforeUpdateSchedule")) {
          cal.on("beforeUpdateSchedule", x.events.beforeUpdateSchedule);
        } else if (HTMLWidgets.shinyMode) {
          cal.on("beforeUpdateSchedule", function(event) {
            var schedule = event.schedule;
            schedule = cal.getSchedule(schedule.id, schedule.calendarId);
            var changes = event.changes;
            //cal.updateSchedule(schedule.id, schedule.calendarId, changes);
            if (changes.hasOwnProperty("end")) {
              changes.end = moment(changes.end._date).format();
            }
            if (changes.hasOwnProperty("start")) {
              changes.start = moment(changes.start._date).format();
            }
            Shiny.setInputValue(el.id + "_update", {
              schedule: {
                id: schedule.id,
                title: schedule.title,
                location: schedule.location,
                start: moment(schedule.start._date).format(),
                end: moment(schedule.end._date).format(),
                isAllDay: schedule.isAllDay,
                category: schedule.isAllDay ? "allday" : "time",
                calendarId: schedule.calendarId
              },
              changes: changes
            });
          });
        }

        if (x.events.hasOwnProperty("clickDayname")) {
          cal.on("clickDayname", x.events.clickDayname);
        }

        if (x.events.hasOwnProperty("clickMorecalendar")) {
          cal.on("clickMorecalendar", x.events.clickMorecalendar);
        }

        if (x.events.hasOwnProperty("clickTimezonesCollapseBtncalendar")) {
          cal.on(
            "clickTimezonesCollapseBtncalendar",
            x.events.clickTimezonesCollapseBtncalendar
          );
        }

        if (HTMLWidgets.shinyMode) {
          Shiny.setInputValue(el.id + "_dates", {
            current: moment(cal.getDate()._date).format(),
            start: moment(cal.getDateRangeStart()._date).format(),
            end: moment(cal.getDateRangeEnd()._date).format()
          });
        }
      },

      getWidget: function() {
        return cal;
      },

      clickPrev: function(event) {
        if (cal !== null) {
          cal.prev();
          renderRange.innerHTML =
            moment(cal.getDateRangeStart()._date).format(formatNav) +
            " - " +
            moment(cal.getDateRangeEnd()._date).format(formatNav);
          Shiny.setInputValue(el.id + "_dates", {
            current: moment(cal.getDate()._date).format(),
            start: moment(cal.getDateRangeStart()._date).format(),
            end: moment(cal.getDateRangeEnd()._date).format()
          });
        }
      },

      clickNext: function(event) {
        if (cal !== null) {
          cal.next();
          renderRange.innerHTML =
            moment(cal.getDateRangeStart()._date).format(formatNav) +
            " - " +
            moment(cal.getDateRangeEnd()._date).format(formatNav);
          Shiny.setInputValue(el.id + "_dates", {
            current: moment(cal.getDate()._date).format(),
            start: moment(cal.getDateRangeStart()._date).format(),
            end: moment(cal.getDateRangeEnd()._date).format()
          });
        }
      },

      clickToday: function(event) {
        if (cal !== null) {
          cal.today();
          renderRange.innerHTML =
            moment(cal.getDateRangeStart()._date).format(formatNav) +
            " - " +
            moment(cal.getDateRangeEnd()._date).format(formatNav);
          Shiny.setInputValue(el.id + "_dates", {
            current: moment(cal.getDate()._date).format(),
            start: moment(cal.getDateRangeStart()._date).format(),
            end: moment(cal.getDateRangeEnd()._date).format()
          });
        }
      },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});


ProxyCalendar();


