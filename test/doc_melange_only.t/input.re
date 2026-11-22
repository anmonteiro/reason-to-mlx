/** First. */
let%melange_only a = 1;

/** Second. */
let%melange_only rec b = () => c()
and c = () => b();

module M = {
  /** Third. */
  [@react.component]
  let%melange_only make = (~a) => <div />;
  let d = 2;
};
