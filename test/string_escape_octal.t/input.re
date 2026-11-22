let octalLooking = "\o101";
let decimal = "\065";
let hex = "\x41\u{41}";
let escapedBackslash = "\\o101";
let matched = switch (x) {
| "\o101" => 1
| _ => 2
};
let quoted = {js|\o101|js};
