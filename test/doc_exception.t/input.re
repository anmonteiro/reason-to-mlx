/** First. */
exception A;
exception B(int);

module M = {
  /** Second. */
  exception C(string);
  exception D;
};

/** Third. */
exception E(int, string);
let x = 1;
