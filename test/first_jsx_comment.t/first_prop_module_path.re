let view = () =>
  <Ui.Button
    // leads the first prop
    size=1
    onClick={_ => ()}>
    {React.string("go")}
  </Ui.Button>;
