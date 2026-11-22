module Comp = {
  [@react.component]
  let make = (~label: string, ~children=?) =>
    <div> (RR.renderDefaultNull(children, c => c)) </div>;
};

let render = (~align, ~children) =>
  <Comp ?align ?children label="hi" />;
