type state = { count : int }

val update : state -> int -> state
val reset : state -> state

module Nested : sig
  val make : int -> int

  val helper : int -> int
end

open Belt
open List

val last : int
(* between last and finalVal: no source blank before this comment, one after *)

val finalVal : int
