(** Public state. *)
type state = { count : int }

(* Update the state. *)
val update : state -> int -> state

module View : sig
  val make : label:string -> ?disabled:bool -> unit -> React.element
end
