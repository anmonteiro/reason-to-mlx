type action('input, 'error) =
  // Explains the first constructor.
  | ModalOpened(string)
  | SetLabelName(string);
