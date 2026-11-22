let w = () => {
  // K1
  let f /* K2 */ = (g: int => int, h: int => int) => { g };
  f
};

let x = () => {
  // K3
  let f /* K4 */ = (~g=(x) => x, ~h=(y) => y) => g;
  f
};

let y = () => {
  // K5
  let rec f /* K6 */ = (g: int => int, h: int => int) => g
  and k = (g: int => int, h: int => int) => h;
  f
};
