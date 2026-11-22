// INTERFACE_HEADER
/** TYPE_DOC */
type state = {
  /** FIRST_FIELD_DOC */
  count: int,
  /* BEFORE_SECOND_FIELD */
  label: string,
};

// BEFORE_VALUE
/** VALUE_DOC */
let update: (state, int) => state;

module type Internal = {
  /* SIGNATURE_HEADER */
  type t;
  /* SIGNATURE_TRAILING */
};

module Empty: {
  // EMPTY_SIGNATURE
};

/* BEFORE_MODULE */
/** MODULE_DOC */
module View: {
  // NESTED_HEADER
  /** NESTED_TYPE_DOC */
  type props = {
    /** NESTED_FIELD_DOC */
    label: string,
    /* NESTED_FIELD_COMMENT */
    disabled: bool,
  };
  /* NESTED_VALUE */
  /** NESTED_VALUE_DOC */
  let make: props => React.element;
  // NESTED_TRAILING
};
// INTERFACE_TRAILING
