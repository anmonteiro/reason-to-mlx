A comment after an extension child of a JSX element stays after the extension,
not inside its brackets.

  $ ../../main.exe extension_child.re
  let own_line () =
    <div>
      [%intl.el {js|Hello|js}]
      (* BEFORE_SPAN *)
      <span />
    </div>
  let same_line () = <div>[%intl.el {js|Hello|js}] (* AFTER_HELLO *) <span /></div>
  let last_child () = <div>[%intl.el {js|Hello|js}] [%intl.el {js|World|js}] (* AFTER_WORLD *) </div>
  let outside_jsx = [%raw "1"] (* AFTER_RAW *)

A comment after an attribute stays outside the attribute payload.

  $ ../../main.exe attribute_neighbor.re
  (* BEFORE_TYPE *)
  type t =
    | A
    | B
  [@@deriving enumerate]
  
  type message = {
    text : string;
    type_ : string; [@mel.as "type"] (* BEFORE_FIELD *)
  }

A trailing comment in a braced branch stays on that branch.

  $ ../../main.exe block_branch.re
  let f x = if x then 1 (* THEN_COMMENT *) else 2 (* ELSE_COMMENT *)
  let g x = if x then 1 else if y then 2 (* ELSE_IF_COMMENT *) else 3 (* LAST_ELSE_COMMENT *)

A comment before a local module stays before it, and one after `open` stays
after the open.

  $ ../../main.exe local_module.re
  let f () =
    (* BEFORE_MODULE *)
    let module M = struct
      let x = 1
    end in
    let open Foo in
    (* AFTER_OPEN *)
    M.x

A comment before a record-update field stays with that field.

  $ ../../main.exe record_update.re
  let f state =
    {
      state with
      a = foo 1;
      (* BEFORE_B *)
      b = 2;
      (* BEFORE_C *)
      c = 3;
    }

A comment before the first field after a record-update base stays with that field.

  $ ../../main.exe record_update_base.re
  let f state =
    {
      state with
      (* BEFORE_FIRST *)
      a = 1;
    }

A comment between two labelled arguments stays before the second argument.

  $ ../../main.exe labelled_argument.re
  let download () =
    Download.string ~fileName:(Printf.sprintf "%s.csv" (name ())) (* BEFORE_MIME *) ~mimeType:"text/plain" res
