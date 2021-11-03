import "widgets";
import dayjs from "dayjs";
import * as utils from "./utils";

export function ProxyCalendar() {
  if (HTMLWidgets.shinyMode) {
    Shiny.addCustomMessageHandler("proxy-toastui-calendar-nav", function (obj) {
      var cal = utils.getWidget(obj.id);
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
          current: dayjs(cal.getDate()._date).format(),
          start: dayjs(cal.getDateRangeStart()._date).format(),
          end: dayjs(cal.getDateRangeEnd()._date).format(),
        });
      }
    });
    Shiny.addCustomMessageHandler(
      "proxy-toastui-calendar-view",
      function (obj) {
        var cal = utils.getWidget(obj.id);
        if (typeof cal != "undefined") {
          cal.changeView(obj.data.view, true);
        }
      }
    );
    Shiny.addCustomMessageHandler("proxy-toastui-calendar-add", function (obj) {
      var cal = utils.getWidget(obj.id);
      if (typeof cal != "undefined") {
        cal.createSchedules(obj.data.schedule);
      }
    });
    Shiny.addCustomMessageHandler(
      "proxy-toastui-calendar-delete",
      function (obj) {
        var cal = utils.getWidget(obj.id);
        if (typeof cal != "undefined") {
          var scheduleId = obj.data.scheduleId;
          var calendarId = obj.data.calendarId;
          for (let i = 0; i < scheduleId.length; i += 1) {
            cal.deleteSchedule(scheduleId[i], calendarId[i]);
          }
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-calendar-update",
      function (obj) {
        var cal = utils.getWidget(obj.id);
        if (typeof cal != "undefined") {
          cal.updateSchedule(
            obj.data.id,
            obj.data.calendarId,
            obj.data.schedule
          );
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-calendar-clear",
      function (obj) {
        var cal = utils.getWidget(obj.id);
        if (typeof cal != "undefined") {
          cal.clear(obj.data.immediately);
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-calendar-options",
      function (obj) {
        var cal = utils.getWidget(obj.id);
        if (typeof cal != "undefined") {
          cal.setOptions(obj.data.options);
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-calendar-toggle",
      function (obj) {
        var cal = utils.getWidget(obj.id);
        if (typeof cal != "undefined") {
          var calendarId = obj.data.calendarId;
          for (let i = 0; i < calendarId.length; i += 1) {
            cal.toggleSchedules(calendarId[i], obj.data.toHide);
          }
        }
      }
    );
  }
}
