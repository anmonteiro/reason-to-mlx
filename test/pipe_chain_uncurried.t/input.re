let toQuery = (dict, filters) =>
  dict
  ->Period.toQuery(filters.period)
  ->Aggregation.toQuery(. filters.aggregation);
