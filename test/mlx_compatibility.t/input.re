module type T = {
  type t;
};

module type Fresh = (X: T) => {
  type t;
};

let render = children => <Component> ...children </Component>;
