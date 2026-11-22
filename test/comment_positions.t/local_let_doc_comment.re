let make = () => {
  /**
   * Updates the selection in the state when the selection changes,
   * by dispatching a `SelectionUpdated` action.
   */
  let%melange_only updateSelection = () => dispatch(SelectionUpdated);
  updateSelection();
};
