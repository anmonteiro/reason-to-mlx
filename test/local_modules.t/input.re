type ranking =
  | Address
  | SharedCount
  | Coverage;

let buildOrder = (~displayMode: DisplayMode.t, ranking) => {
  open Warehouse.Comparison;
  module Query = FieldDescription.Query;
  module Direction = Query.Direction;

  switch (ranking) {
  | Address => [Direction.simple(ComparedItem.(get(address)))]
  | SharedCount => [Direction.simple(ComparedItem.(get(sharedCount)))]
  | Coverage => [Direction.simple(ComparedItem.(get(coveragePercent)))]
  };
};
