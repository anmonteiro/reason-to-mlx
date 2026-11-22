let a = () =>
  <Stack gap=Px16> // k1
    <Text> {React.string("x")} </Text>
    <Text> {React.string("y")} </Text> // k2
  </Stack>;

let b = () =>
  <Stack gap=Px16> /* k3 */
    <Text> {React.string("x")} </Text>
  </Stack>;

let c = () =>
  <div> // k4
    {React.string("x")}
  </div>;

let d = () =>
  <div> /* k5 */ <span /> </div>;

let e = () =>
  <div> /* k6 */ {React.string("x")} </div>;
