/*global HTMLWidgets, tui, moment, Shiny */
HTMLWidgets.widget({
  name: "calendar",

  type: "output",

  factory: function(el, width, height) {
    var Calendar = tui.Calendar;
    var cal, renderRange;

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
          renderRange = document.getElementById(el.id + "_renderRange");
          renderRange.innerHTML =
            dateToYMD(cal.getDateRangeStart()) +
            " - " +
            dateToYMD(cal.getDateRangeEnd());

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

        // shiny input
        if (HTMLWidgets.shinyMode) {
          Shiny.setInputValue(el.id + "_dates", {
            current: moment(cal.getDate()._date).format(),
            start: moment(cal.getDateRangeStart()._date).format(),
            end: moment(cal.getDateRangeEnd()._date).format()
          });

          if (x.events.hasOwnProperty("beforeCreateSchedule")) {
            cal.on("beforeCreateSchedule", x.events.beforeCreateSchedule);
          } else {
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
          } else {
            cal.on("afterRenderSchedule", function(event) {
              var schedule = event.schedule;
              schedule = cal.getSchedule(schedule.id, schedule.calendarId);
              Shiny.setInputValue(el.id + "_schedules", schedule);
            });
          }

          if (x.events.hasOwnProperty("clickSchedule")) {
            cal.on("clickSchedule", x.events.clickSchedule);
          } else {
            cal.on("clickSchedule", function(event) {
              var schedule = event.schedule;
              schedule = cal.getSchedule(schedule.id, schedule.calendarId);
              Shiny.setInputValue(el.id + "_click", schedule);
            });
          }

          if (x.events.hasOwnProperty("beforeDeleteSchedule")) {
            cal.on("beforeDeleteSchedule", x.events.beforeDeleteSchedule);
          } else {
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
          } else {
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
        }
      },

      getWidget: function() {
        return cal;
      },

      clickPrev: function(event) {
        if (cal !== null) {
          cal.prev();
          renderRange.innerHTML =
            dateToYMD(cal.getDateRangeStart()) +
            " - " +
            dateToYMD(cal.getDateRangeEnd());
        }
      },

      clickNext: function(event) {
        if (cal !== null) {
          cal.next();
          renderRange.innerHTML =
            dateToYMD(cal.getDateRangeStart()) +
            " - " +
            dateToYMD(cal.getDateRangeEnd());
        }
      },

      clickToday: function(event) {
        if (cal !== null) {
          cal.today();
          renderRange.innerHTML =
            dateToYMD(cal.getDateRangeStart()) +
            " - " +
            dateToYMD(cal.getDateRangeEnd());
        }
      },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});

// From Friss tuto (https://github.com/FrissAnalytics/shinyJsTutorials/blob/master/tutorials/tutorial_03.Rmd)
function get_widget(id) {
  // Get the HTMLWidgets object
  var htmlWidgetsObj = HTMLWidgets.find("#" + id);

  // Use the getWidget method we created to get the underlying widget
  var widgetObj;

  if (typeof htmlWidgetsObj != "undefined") {
    widgetObj = htmlWidgetsObj.getWidget();
  }

  return widgetObj;
}

function dateToYMD(date) {
  var d = date.getDate();
  var m = date.getMonth() + 1; //Month from 0 to 11
  var y = date.getFullYear();
  return "" + y + "-" + (m <= 9 ? "0" + m : m) + "-" + (d <= 9 ? "0" + d : d);
}

if (HTMLWidgets.shinyMode) {
  Shiny.addCustomMessageHandler("proxy-tui-calendar-nav", function(obj) {
    var cal = get_widget(obj.id);
    if (typeof cal != "undefined") {
      if (obj.data.where == "prev") {
        cal.prev();
      }
      if (obj.data.where == "next") {
        cal.next();
      }
      if (obj.data.where == "today") {
        cal.today();
      }
      if (obj.data.where == "date") {
        cal.setDate(obj.data.date);
      }
      Shiny.setInputValue(obj.id + "_dates", {
        current: moment(cal.getDate()._date).format(),
        start: moment(cal.getDateRangeStart()._date).format(),
        end: moment(cal.getDateRangeEnd()._date).format()
      });
    }
  });
  Shiny.addCustomMessageHandler("proxy-tui-calendar-view", function(obj) {
    var cal = get_widget(obj.id);
    if (typeof cal != "undefined") {
      cal.changeView(obj.data.view, true);
    }
  });
  Shiny.addCustomMessageHandler("proxy-tui-calendar-create", function(obj) {
    var cal = get_widget(obj.id);
    if (typeof cal != "undefined") {
      cal.createSchedules(obj.data.schedule);
    }
  });
  Shiny.addCustomMessageHandler("proxy-tui-calendar-delete", function(obj) {
    var cal = get_widget(obj.id);
    if (typeof cal != "undefined") {
      cal.deleteSchedule(obj.data.id, obj.data.calendarId);
    }
  });
  Shiny.addCustomMessageHandler("proxy-tui-calendar-update", function(obj) {
    var cal = get_widget(obj.id);
    if (typeof cal != "undefined") {
      cal.updateSchedule(obj.data.id, obj.data.calendarId, obj.data.schedule);
    }
  });
  Shiny.addCustomMessageHandler("proxy-tui-calendar-clear", function(obj) {
    var cal = get_widget(obj.id);
    if (typeof cal != "undefined") {
      cal.clear(obj.data.immediately);
    }
  });
  Shiny.addCustomMessageHandler("proxy-tui-calendar-options", function(obj) {
    var cal = get_widget(obj.id);
    if (typeof cal != "undefined") {
      cal.setOptions(obj.data.options);
    }
  });
}

