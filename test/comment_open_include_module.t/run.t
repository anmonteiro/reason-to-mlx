A trailing comment after `open`, `include`, `module` and `let%melange_only`
stays on its own item.

  $ ../../main.exe items.re
  open Foo (* OPEN_COMMENT *)
  include Bar (* INCLUDE_COMMENT *)
  module M = Baz (* MODULE_COMMENT *)
  let%melange_only a = 4 (* MELANGE_ONLY_COMMENT *)
  let b = 2

The same in a signature.

  $ ../../main.exe signature.rei
  open Foo (* OPEN_COMMENT *)
  include S (* INCLUDE_COMMENT *)
  module M : S (* MODULE_COMMENT *)
  module type T = S (* MODULE_TYPE_COMMENT *)
  val a : int

After a local `open`, the same-line comment stays before the next-line comment.

  $ ../../main.exe local_open.re
  let a =
    let open M in
    (* SAME_LINE *)
    (* OWN_LINE *)
    let y = 1 in
    y
