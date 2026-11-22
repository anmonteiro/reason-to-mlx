// RFC 4180 compliant CSV parser with delimiter auto-detection.
//
// Known limit: a quoted value cannot contain a line break. RFC 4180 allows it, but this parser
// splits the text into lines first, so such a value is torn into two broken rows. Example:
//
//   prompt,tags
//   "best shoes
//   for running",gear
//
// RFC 4180 reads this as one row: ["best shoes\nfor running", "gear"].
// This parser reads it as two rows: ["best shoes"] and ["for running\"", "gear"].
//
// Nobody has needed line breaks inside values so far. Supporting them means walking the whole text
// character by character instead of splitting on line breaks first.

type parsedCsv = {rows: array(array(string))};

let useKinds = (baseKey) => {
  // One current+compare fetch per selected series kind. Extracted as a hook (rather than hand-rolling
  // useState/useRef/useEffect per kind) since there are 7 kinds to fetch; `values=None` means "nothing of
  // this kind selected" and resets both periods to NotAsked instead of fetching.
  let useKindFetch = (~kindTag) => kindTag ++ baseKey;
  useKindFetch;
};

let defaultSettings = {
  by: `Volume,
  // (* todo - do we use these metrics in Grades? *)
  withPosition: false,
};
