let toQuery = (~onlyData=false, filters) =>
  Js.Dict.empty()
  ->Period.toQuery(filters.period)
  ->Aggregation.toQuery(filters.aggregation)
  ->Metric.toQuery(filters.metric)
  ->Pagination.toQuery(filters.pagination)
  ->Country.toQuery(filters.country)
  ->Device.toQuery(filters.device)
  ->SearchType.toQuery(filters.searchType)
  ->(dict => onlyData ? dict : dict->Columns.toQuery(filters.columns));
