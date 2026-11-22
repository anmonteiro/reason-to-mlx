let f = x =>
  switch (x) {
  | A
  | B =>
    // Unexpected case since new subscriptions can be only monthly/yearly
    1
  | C when x == C =>
    // one
    // two
    2
  | D => 3
  };
