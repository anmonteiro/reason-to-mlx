let momentUtc = () => MomentUtils.nowUtc();

let tzWeekdayToUtc = (weekday, hour, tz) =>
  MomentUtils.(
    (momentUtc() |> toTz(tz))->setDay(weekday->PmWeekday.toInt)->setHour(hour)
    |> toTz(`UTC)
    |> getDay
    |> PmWeekday.ofInt
  );
