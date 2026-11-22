let f = () => {
  let a = 1;
  let outer = () => {
    let b = 2;
    /** Documents a local let nested two levels deep — with an em dash. */
    let c = 3;
    b + c;
  };
  a + outer();
};
