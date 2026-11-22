type nodeId;
type props;

module rec Branch: {
  let makeProps: (~id: nodeId, ~level: int, unit) => props;
  let make: props => React.element;
} = {
  [@mel.obj]
  external makeProps: (~id: nodeId, ~level: int, unit) => props;

  let make = props => <BranchView props />;
};
