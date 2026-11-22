A doc comment on an exception goes before it, so the next item cannot claim it.

  $ ../../main.exe input.re
  (** First. *)
  exception A
  
  exception B of int
  
  module M = struct
    (** Second. *)
    exception C of string
  
    exception D
  end
  
  (** Third. *)
  exception E of int * string
  
  let x = 1

  $ ../../main.exe sig.rei
  (** First. *)
  exception A
  
  exception B of int
  
  (** Second. *)
  exception C of string
  
  val x : int
