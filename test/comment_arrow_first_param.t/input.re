[@mel.send]
external toBeCloseTo:
  (
    // k1
    ~expected: float,
    // k2
    ~numDigits: int,
    ~timeout: int=?,
    unit
  ) =>
  unit = "toBeCloseTo";

type cb = (
  // k3
  ~a: int,
  // k4
  ~b: int
) => unit;
