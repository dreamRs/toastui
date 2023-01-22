import "widgets";
import dayjs from "dayjs";
import * as utils from "./utils";
import { formatDateNav, getNavOptions } from "./calendar-utils";

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
          current: dayjs(cal.getDate()).format(),
          start: dayjs(cal.getDateRangeStart()).format(),
          end: dayjs(cal.getDateRangeEnd()).format(),
        });
      }
    });
    Shiny.addCustomMessageHandler(
      "proxy-toastui-calendar-view",
      function (obj) {
        var cal = utils.getWidget(obj.id);
        if (typeof cal != "undefined") {
          cal.changeView(obj.data.view, true);
          var renderRange = document.getElementById(obj.id + "_renderRange");
          if (typeof renderRange != "undefined") {
            var options = getNavOptions(obj.id);
            var formatNav = options.fmt_date;
            var sepNav = options.sep_date;
            renderRange.innerHTML = formatDateNav(cal, formatNav, sepNav);
          }
        }
      }
    );
    Shiny.addCustomMessageHandler("proxy-toastui-calendar-add", function (obj) {
      var cal = utils.getWidget(obj.id);
      if (typeof cal != "undefined") {
        cal.createEvents(obj.data.schedule);
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
            cal.deleteEvent(scheduleId[i], calendarId[i]);
          }
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-calendar-update",
      function (obj) {
        var cal = utils.getWidget(obj.id);
        if (typeof cal != "undefined") {
          cal.updateEvent(
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
          cal.clear();
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-calendar-options",
      function (obj) {
        var cal = utils.getWidget(obj.id);
        if (typeof cal != "undefined" && typeof obj.data != "undefined") {
          if (typeof obj.data.options != "undefined") {
            cal.setOptions(obj.data.options);
          }
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
            cal.setCalendarVisibility(calendarId[i], obj.data.toHide);
          }
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-calendar-navigation",
      function (obj) {
        var cal = utils.getWidget(obj.id);
        if (typeof cal != "undefined" && typeof obj.data != "undefined") {
          if (typeof obj.data.navigation === "boolean") {
            var nav = obj.data.navigation;
            var menu = document.getElementById(obj.id + "_menu");
            // turn on and does not exists
            if (nav && menu !== null) {
              menu.style.display = "block";
            }
            // turn off and exists
            if (!nav && menu !== null){
              menu.style.display = "none";
            }
          }
        }
      }
    );
  }
}
