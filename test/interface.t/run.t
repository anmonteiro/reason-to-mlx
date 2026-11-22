  $ cp input.re input.rei
  $ ../../main.exe input.rei -o actual.mli
  $ diff -u output.mli actual.mli

  $ ../../main.exe input.rei > actual-default.mli
  $ diff -u output.mli actual-default.mli

Regular and documentation comments survive in nested signatures.

  $ ../../main.exe comments.rei | grep -v '^$'
  (* INTERFACE_HEADER *)
  (** TYPE_DOC *)
  type state = {
    count : int;  (** FIRST_FIELD_DOC *)
    (* BEFORE_SECOND_FIELD *)
    label : string;
  }
  (* BEFORE_VALUE *)
  (** VALUE_DOC *)
  val update : state -> int -> state
  module type Internal = sig
    (* SIGNATURE_HEADER *) type t (* SIGNATURE_TRAILING *)
  end
  module Empty : sig
    (* EMPTY_SIGNATURE *)
  end
  (* BEFORE_MODULE *)
  (** MODULE_DOC *)
  module View : sig
    (* NESTED_HEADER *)
    (** NESTED_TYPE_DOC *)
    type props = {
      label : string;  (** NESTED_FIELD_DOC *)
      (* NESTED_FIELD_COMMENT *)
      disabled : bool;
    }
    (* NESTED_VALUE *)
    (** NESTED_VALUE_DOC *)
    val make : props -> React.element
    (* NESTED_TRAILING *)
  end
  (* INTERFACE_TRAILING *)

A comment-only interface also works from standard input.

  $ printf '// INTERFACE_ONLY' | ../../main.exe -o only.mli
  $ cat only.mli
  (* INTERFACE_ONLY *)

Signature extensions must not capture comments from later declarations.

  $ ../../main.exe extension_scope.rei | grep -v '^$'
  [%%raw "interface payload"]
  (* AFTER_SIGNATURE_EXTENSION *)
  val value : int
  module Nested : sig
    [%%raw "nested signature payload"]
    (* AFTER_NESTED_SIGNATURE_EXTENSION *)
    val value : string
  end

Marker-looking text also survives in signature attributes and comments.

  $ ../../main.exe marker_text.rei | grep -v '^$'
  val text : int [@@test "[@reason_to_mlx.comment_0]"]
  val quoted : int [@@test {raw|[@@@reason_to_mlx.comment_0]|raw}]
  (* INTERFACE_TAIL *)
  val documentation : int [@@test "[@reason_to_mlx.doc_comment_0]"]
  val quotedDocumentation : int [@@test {raw|[@@@reason_to_mlx.doc_comment_0]|raw}]
  (** INTERFACE_VALUE *)
  val value : int
  (* [@reason_to_mlx.comment_2] *)
  (* AFTER_INTERFACE_MARKER_TEXT *)

Every fixture's converter output must also be stable under ocamlformat:
reformatting it must reproduce the same text, with no error. Plain
`ocamlformat`, not `ocamlformat-mlx`, is the right check here: a `.mli`
signature has no JSX to format.

  $ for f in *.rei; do
  >   ../../main.exe "$f" -o rt_out.mli 2>rt_err.log \
  >     || { echo "CONVERTER ERROR on $f:"; cat rt_err.log; continue; }
  >   ocamlformat --enable-outside-detected-project rt_out.mli \
  >     > rt_fmt.mli 2>rt_fmt_err.log \
  >     || { echo "FORMATTER ERROR on $f:"; cat rt_fmt_err.log; continue; }
  >   diff rt_out.mli rt_fmt.mli > /dev/null \
  >     || { echo "ROUND-TRIP DIFF on $f:"; diff rt_out.mli rt_fmt.mli; }
  > done
  $ rm -f rt_out.mli rt_fmt.mli rt_err.log rt_fmt_err.log
