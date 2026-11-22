let f = (state, selectedLabels, mediaItems) => {
  ...state,
  selectedLabels,
  // Doc comment for mediaState.
  mediaState: g(mediaItems),
};
