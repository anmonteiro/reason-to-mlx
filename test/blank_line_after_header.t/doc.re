/**
  Components that occupy a fixed strip on the right edge of the viewport (e.g. the
  docked Agent panel, non-overlay right `SidePanel`s) render [<Style />] to publish
  their width. Modal overlays read this width so they only cover the main content
  area and leave the right panel accessible.

  Implemented as a rendered <style> tag (rather than a useEffect on
  documentElement) so the CSS variable is bound to React render state — no
  mount/cleanup races, and it disappears immediately when the panel closes.

  Only one tracker is expected to be active at a time. If multiple panels render
  simultaneously, the last <style> in DOM order wins.
*/

let varName = "--acme-right-panel-width";
let cssWidthExpression = {j|calc(100vw - var($(varName), 0px))|j};
