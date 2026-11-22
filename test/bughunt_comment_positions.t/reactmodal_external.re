external make:
  (
    ~onAfterClose: unit => unit=?, // react-modal fires this after close
    ~onAfterOpen: unit => unit=?,
    // Caveat: this one never fires on a programmatic isOpen change
    ~onRequestClose: unit => unit,
    ~contentLabel: string=?,
    // Prefer isOpen over unmounting
    ~isOpen: bool,
    ~children: string
  ) =>
  string =
  "default";
