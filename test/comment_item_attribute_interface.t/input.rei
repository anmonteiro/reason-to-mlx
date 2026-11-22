[@mel.module "m"]
// c1
external e: int => int = "e";

[@live "x"]
/* c2 */
[@dead "y"]
// c3
let v: int;

[@live]
// c4
type t = int;

[@live]
// c5
exception E(int);
