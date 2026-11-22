A Reason string keeps `\o101` as a backslash followed by `o101`, but OCaml reads
it as `A`. The backslash is doubled, so OCaml reads the same bytes.

  $ ../../main.exe input.re 2>/dev/null
  let octalLooking = "\\o101"
  let decimal = "\065"
  let hex = "\x41\u{41}"
  let escapedBackslash = "\\o101"
  let matched =
    match x with
    | "\\o101" -> 1
    | _ -> 2
  let quoted = {js|\o101|js}
