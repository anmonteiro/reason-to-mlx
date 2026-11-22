  $ ../../main.exe input.re | grep -v '^$'
  (** Top-level documentation. *)
  let answer = 42
  type profile = {
    name : string;  (** Field documentation. *)
    active : bool;
  }
  type status =
    | Ready  (** Constructor documentation. *)
    | Failed
  (** Module documentation. *)
  module Nested = struct
    (** Nested value documentation. *)
    let value = 1
  end
  (** Café documentation in 東京. *)
  let greeting = "hello"

Regular comments can follow documented record fields.

  $ ../../main.exe mixed_record.re -o mixed_record.actual.mlx
  $ diff -u mixed_record.mlx mixed_record.actual.mlx
