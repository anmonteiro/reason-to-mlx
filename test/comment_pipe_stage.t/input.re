let filtered =
  sortedPatches
  // filter one
  ->List.filter(patch => {
    let a = 1;
    a == patch.x;
  })
  // filter two
  ->List.filter(patch => {
    let b = 2;
    b == patch.y;
  })
  // map it
  ->List.map(patch => {
    let c = 3;
    c + patch.z;
  });
