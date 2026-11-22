module type Measure = {
  type t;
  let isImprovement: t => bool;
  let shouldShow: t => bool;
  let formatValue: t => string;
  let reversed: bool;
};

module BuildBadge = (Source: Measure) => {
  type t = Source.t;

  let tone = value =>
    if (Source.reversed) {
      Source.isImprovement(value) ? Palette.Negative : Palette.Positive;
    } else {
      Source.isImprovement(value) ? Palette.Positive : Palette.Negative;
    };

  let render = value =>
    Source.shouldShow(value)
      ? Some((Source.formatValue(value), tone(value)))
      : None;
};
