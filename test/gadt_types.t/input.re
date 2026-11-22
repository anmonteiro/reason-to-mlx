type selector('value) =
  | ByField(Field.t('value)): selector('value)
  | ByEvent: selector(Event.t);

type settings('value) = {
  selected: list('value),
  hovered: option('value),
};

type packed =
  | Packed(selector('value), settings('value)): packed;

type action =
  | ReplaceSelected(selector('value), list('value)): action
  | ReplaceHovered(selector('value), option('value)): action;
