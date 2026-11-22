let renderMasonry = (~quotes) =>
  <ReactMasonryCss
    breakpointCols={
      "default": 3,
      "1279": 2,
      "767": 1,
    }
    className="masonryGrid">
    {quotes}
  </ReactMasonryCss>;
