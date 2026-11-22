A doc comment on `let%melange_only` goes before the `let`.

  $ ../../main.exe input.re
  (** First. *)
  let%melange_only a = 1
  
  (** Second. *)
  let%melange_only rec b () = c ()
  
  and c () = b ()
  
  module M = struct
    (** Third. *)
    let%melange_only[@react.component] make ~a = <div />
  
    let d = 2
  end
