An own-line comment between polymorphic variant tags stays before its tag.

  $ ../../main.exe poly.re
  type t =
    [ (* FIRST *)
      `a
    | `b [@as "b-b"]
    | (* SECOND *)
      `c
    | (* THIRD *)
      `d
      [@as "d-d"]
    ]

A comment before the first argument of a constructor stays before that
argument when the previous constructor has a record payload.

  $ ../../main.exe constructor.re
  type t =
    | C of { a : int }
    | E of (* FIRST_ARGUMENT *) int * string

  $ ../../main.exe signature.rei
  type t =
    | B of { x : int } (* TRAILING *)
    | C of (* ARGUMENT *) int
