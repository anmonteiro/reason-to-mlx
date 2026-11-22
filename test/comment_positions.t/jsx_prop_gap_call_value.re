let make = (~size) =>
  <SvgIcon
    customViewBox={size->getViewBox}
    // Info icon does not support adaptive size for now.
    size={NonAdaptive(size->getSize)}
  />;
