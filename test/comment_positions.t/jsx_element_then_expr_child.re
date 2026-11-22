let view = (~isOpen, ~children) =>
  <div>
    <CloseButton onClick={() => onClose()} />
    /* HACK: should wait until animation stops */
    {RR.renderIfTrue(isOpen, children)}
  </div>;
