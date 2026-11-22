let download = () =>
  Download.string(
    ~fileName=Printf.sprintf("%s.csv", name()),
    // BEFORE_MIME
    ~mimeType="text/plain",
    res,
  );
