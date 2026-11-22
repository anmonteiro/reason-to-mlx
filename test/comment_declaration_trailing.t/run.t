A trailing comment on a variant constructor stays on that constructor, also
the last one and before an attribute that follows the type.

  $ ../../main.exe variant.re
  type direction =
    | Up (* UP_COMMENT *)
    | Down (* DOWN_COMMENT *)
    | Left (* LEFT_COMMENT *)
  let after = 1
  
  type size =
    | Small (* SMALL_COMMENT *)
    | Large (* LARGE_COMMENT *)
  [@@deriving toString]

The same holds for polymorphic variant tags.

  $ ../../main.exe polyvariant.re
  type t =
    [ `A (* A_COMMENT *)
    | `B (* B_COMMENT *)
    ]
  let after = 1

A trailing comment after `external` and `exception` stays on the same line.

  $ ../../main.exe items.re
  external a : int -> int = "a" (* EXTERNAL_COMMENT *)
  
  (* BEFORE_B *)
  external b : int -> int = "b"
  external c : int -> int = "c" [@@mel.module "react"] (* ATTRIBUTED_EXTERNAL_COMMENT *)
  exception Foo of string (* EXCEPTION_COMMENT *)
  let after = 1

Signature items keep their trailing comments.

  $ ../../main.exe signature.rei
  module type S = sig
    val a : int (* VAL_COMMENT *)
    val b : int (* SECOND_VAL_COMMENT *)
    type t (* TYPE_COMMENT *)
  end
  type direction =
    | Up (* UP_COMMENT *)
    | Down (* DOWN_COMMENT *)

A comment after a functor parameter's module type stays on that parameter.

  $ ../../main.exe functor.re
  module F (X : S (* FIRST_PARAMETER *)) (Y : S (* SECOND_PARAMETER *)) = struct
    let z = 1
  end

A comment before an object type key prints before that key.

  $ ../../main.exe object_type.re
  type t = < (* FIRST_KEY *) a : int ; (* SECOND_KEY *) b : string >
  type u = < (* FIRST_LINE_KEY *) a : int ; (* SECOND_LINE_KEY *) b : string >
