import dayjs from "dayjs";

export function formatDateNav(calendar, fmt = "YYYY-MM-DD", sep = " - ") {
  var start = calendar.getDateRangeStart()._date;
  start = dayjs(start).subtract(7, "day").endOf("month");
  start = start.add(1, "day");
  start = start.format(fmt);
  var end = calendar.getDateRangeEnd()._date;
  end = dayjs(end).add(7, "day").startOf("month");
  end = end.subtract(1, "day");
  end = end.format(fmt);
  return start + sep + end;
}
