let view = () =>
  <>
    {x ? <A /> : RR.null}
    // note
    <B />
    {y ? <A /> : RR.null}
    // second
    <C />
  </>;
