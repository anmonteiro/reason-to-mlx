let make:
  (
    ~closeDropdownRef: React.ref(unit => unit)=?, // While the dropdown is open, holds a function that closes it.
    ~columnDividerStyle: int=?,
    unit
  ) =>
  unit;
