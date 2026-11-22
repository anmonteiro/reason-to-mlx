let toQuery = (queryDict, filters) =>
  queryDict
  ->Period.toQuery(filters.period, ~strict=true)
  ->Aggregation.toQuery(filters.aggregation, ~limit=?filters.limit);
