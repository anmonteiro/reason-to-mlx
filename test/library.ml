let expect expected = function
  | Ok actual when String.equal expected actual -> ()
  | Ok actual -> failwith (Printf.sprintf "Expected %S, got %S" expected actual)
  | Error message -> failwith message

let () =
  Reason_to_mlx.convert "let answer = 42;" |> expect "let answer = 42\n";
  Reason_to_mlx.convert ~kind:Signature "let answer: int;"
  |> expect "val answer : int\n";
  Reason_to_mlx.convert "let view = (~children) => <Foo children />;"
  |> expect "let view ~children = <Foo>...children</Foo>\n";
  (match Reason_to_mlx.convert "let =" with
  | Error message when String.length message > 0 -> ()
  | _ -> failwith "Expected a diagnostic for invalid Reason");
  (* A failed conversion must not prevent later calls in a long-lived client. *)
  Reason_to_mlx.convert "let answer = 43;" |> expect "let answer = 43\n"
