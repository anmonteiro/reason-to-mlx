[@react.component]
let make = (~color: Section_Css.color=`blue) => {
  // Show banner only at desired time interval.
  isBannerAvailable->RR.renderIfTrue(<StAprilFoolsDayBanner color />);
};
