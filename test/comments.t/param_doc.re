[@react.component]
let make = (
  /* Tabs hidden from the user. */
  ~hiddenTabs,
  ~label,
) => {
  <div> {React.string(label)} </div>;
};
