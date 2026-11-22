module Decode = {
  let array = decode => (. json) => decode(. json);
  let list = decode => (. json) => (array(decode))(. json)->Array.to_list;
};
