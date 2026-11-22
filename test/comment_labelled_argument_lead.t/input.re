let f = () =>
  Export.make(
    ~metric,
    // The widget stores the report in its own DB shape, as plain keyword texts
    ~report=Report.toV2(a, b),
    ~mimeType="text/csv",
    // short
    ~fileName="a.csv",
  );
let g = () =>
  testFunc(
    // page 6 out of 11 covers the edge of the other rules from both sides, plus the middle
    ~text="Selected page 6",
    ~count=1,
  );
let h = () => k(1, 2, // about three
  3);
let view = () =>
  <Modal
    isOpen={isModalOpen}
    onClose={_ => setIsModalOpen(false)}
    // nothing to refetch, access is always Success(_) in this modal
    onRefetchRequested=Fn.noop
    title="A fairly long title string to force the line to break across several lines in output"
  />;
