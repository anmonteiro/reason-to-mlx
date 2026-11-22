let view = (a, b) =>
  switch (a, b) {
  | (None, _) => RR.null
  | (Some(_), Some(info)) =>
    // leading comment one
    // leading comment two
    <Stack gap=12>
      <DetailsRow label="x" value={info} />
    </Stack>
  };
