(* c1 *)
external e : int -> int = "e" [@@mel.module "m"]

(* c2 *)
(* c3 *)
val v : int [@@live "x"] [@@dead "y"]

(* c4 *)
type t = int [@@live]

(* c5 *)
exception E of int [@live]
