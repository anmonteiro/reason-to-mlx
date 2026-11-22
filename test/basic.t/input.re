type state = {count: int};

let update = state => {...state, count: state.count + 1};

let view = (~label, ~disabled=false, ()) =>
  <Button label ?disabled>
    <span> {React.string(label)} </span>
  </Button>;
