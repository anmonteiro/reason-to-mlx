val make :
  ?closeDropdownRef:(unit -> unit) React.ref (* While the dropdown is open, holds a function that closes it. *) ->
  ?columnDividerStyle:int ->
  unit ->
  unit
