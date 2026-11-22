module PendingNode = {
  let use = (notifyOutside, resolveNode) => {
    let handlePointer =
      React.useCallback1(
        pointerEvent => {
          let clickedNode = pointerEvent->PointerSource.fromEvent->PageEvent.targetElement;
          let containerNode = resolveNode();
          Option.forEach(containerNode, boundaryNode =>
            if (!DomElement.contains(clickedNode, boundaryNode)) {
              notifyOutside(pointerEvent);
            }
          );
        },
        [|notifyOutside|],
      );
    React.useEffect1(
      () => {
        let pageTarget = PageDocument.asEventTarget(pageDocument);
        PageTarget.addPointerListener(handlePointer, pageTarget);
        Some(_ => PageTarget.removePointerListener(handlePointer, pageTarget));
      },
      [|handlePointer|],
    );
  };
};
