let multilineString = "first line
\"quoted\" and \\backslash
last line";

let multilineJs = {js|first line
"quoted" and \backslash
last line|js};

let multilineRaw = {|first line
"quoted" and \backslash
last line|};

let delimiterCollision = "first |}
second |mlx}
last";

/* Written on one source line: the decoded value contains '\n', but
   nothing here was ever multi-line, so it must stay an ordinary escaped
   string, not become a raw literal that visually breaks it in two. */
let keywordsSeparator = "[,\n]";

let melRawExpression = [%mel.raw {js|function () {
  return "C:\\tmp";
}|js}];

let rawExpression = [%raw {|function () {
  return "C:\tmp";
}|}];

let bsRawExpression = [%bs.raw {|function () {
  return "C:\tmp";
}|}];

[%%mel.raw {|const multiline = "first\nsecond";|}];

[%%raw {js|const path = "C:\\tmp";|js}];
