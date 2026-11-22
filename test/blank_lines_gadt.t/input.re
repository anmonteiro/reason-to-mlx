type selector('value) =
  | ByField(Field.t('value)): selector('value)

  | ByEvent: selector(Event.t);

type packed =
  | Packed(selector('value)): packed;
type action =
  | ReplaceSelected(selector('value)): action;

let describe: type a. selector(a) => string =
  fun
  | ByField(_) => "field"
  | ByEvent => "event";

let classify = (x: selector('value)) => {
  let prefix = "selector: ";

  let label =
    switch (x) {
    | ByField(_) => "field"
    | ByEvent => "event"
    };
  prefix ++ label;
};

let describeTwo: type a. (selector(a), selector(a)) => string =
  (x, y) => {
    let left = describe(x);
    /* no blank before this comment, one blank after it */

    let right = describe(y);
    left ++ right;
  };
