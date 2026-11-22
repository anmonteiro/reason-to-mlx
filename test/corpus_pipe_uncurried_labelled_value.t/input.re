let rec truncateLongStringsInJson = (~maxLen, json: Js.Json.t) =>
  switch (json->Js.Json.classify) {
  | JSONString(str) =>
    if (str->String.length > maxLen) {
      Js.Json.string(
        [
          str->String.substring(~from=0, ~to_=maxLen),
          "...",
          "(more",
          (str->String.length - maxLen)->NumFormat.Int.format,
          ")",
        ]
        ->List.joinWith(" "),
      );
    } else {
      json;
    }
  | JSONArray(arr) => arr->Array.map(item => truncateLongStringsInJson(~maxLen, item))->Js.Json.array
  | JSONObject(obj) => obj->Js.Dict.map(~f=(. value) => truncateLongStringsInJson(~maxLen, value))->Js.Json.object_
  | JSONNull
  | JSONFalse
  | JSONTrue
  | JSONNumber(_) => json
  };
