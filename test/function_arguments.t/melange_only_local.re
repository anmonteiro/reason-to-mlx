let use = () => {
  let%melange_only combine = (~left, ~right) => left + right;
  combine(~left=1, ~right=2);
};
