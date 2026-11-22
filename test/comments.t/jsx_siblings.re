let view = footer =>
  switch (footer) {
  | None => React.null
  | Some(footer) =>
    <Grid>
      modal
      // First sibling comment.
      // Second sibling comment.
      // Third sibling comment.
      <ReportFooter footer />
    </Grid>
  };
