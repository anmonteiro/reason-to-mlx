let%melange_only add = (a /* after a */, b) => {
  // before the sum
  a + b /* after the sum */
};

let%melange_only value = /* before the value */ 1;

let platform = switch%platform (Runtime.platform) {
  | Native => /* before native */ 1
  | Client => 2 /* after client */
};
