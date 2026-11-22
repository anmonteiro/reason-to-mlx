let f = xs =>
  xs
  ->List.map(x => x + 1)
  ->([@alert "-unsafe_keys"] RR.indexKeyedList)(Fn.identity);
