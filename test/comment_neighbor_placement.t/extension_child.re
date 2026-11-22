let own_line = () =>
  <div>
    [%intl.el {js|Hello|js}]
    // BEFORE_SPAN
    <span />
  </div>;
let same_line = () =>
  <div>
    [%intl.el {js|Hello|js}] // AFTER_HELLO
    <span />
  </div>;
let last_child = () =>
  <div>
    [%intl.el {js|Hello|js}]
    [%intl.el {js|World|js}]
    // AFTER_WORLD
  </div>;
let outside_jsx = [%raw "1"]; // AFTER_RAW
