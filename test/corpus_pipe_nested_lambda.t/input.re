let parseIntList = (str: string): list(int) =>
  str->String.split(",")->List.fromArray->List.filterMap(Int.fromString);

/** Parse a comma-separated list of location ids from a query string value */
let parseLocationIdList = (str: string): list(Ls_location.Id.t) =>
  str
  ->String.split(",")
  ->List.fromArray
  ->List.filterMap(id => id->Int64.of_string_opt->Option.map(Ls_location.Id.of_int64));
