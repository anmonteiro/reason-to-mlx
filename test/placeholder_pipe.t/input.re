let div = Webapi.Dom.document->Webapi.Dom.Document.createElement("div", _);

let renderMoney = (~money, column, json) =>
  switch (column) {
  | Cpc => Q.Metric.Field.value_of_json(Q.Metric.metric(Metric_avg_cpc), json)->AdsMoney.format(money, _)
  | Cost => Q.Metric.Field.value_of_json(Q.Metric.metric(Metric_cost), json)->AdsMoney.format(money, _)
  };

let defaults = country => {
  ...getDefault(),
  countryAndGroupBy: country->CountryAndGroupBy.fromCountry(~country=_, ~default=Location),
};

let make = (~lastDay=?, ~onChange) =>
  <DropdownWithCalendar
    onChange={(value: DropdownWithCalendar.value(preset)) => value->maybeDateRangeToMoment(~lastDay?, _)->onChange}
  />;

let fromString = (query: string, ~settings: TkGetSeSettingsInterface.data) =>
  Url.parseQueryToDict(query, ())->fromQuery(~settings, ~prevQuery=Js.Dict.empty(), ~query=_);
