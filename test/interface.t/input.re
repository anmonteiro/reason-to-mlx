/** Public state. */
type state = {count: int};

// Update the state.
let update: (state, int) => state;

module View: {
  let make: (~label: string, ~disabled: bool=?, unit) => React.element;
};
