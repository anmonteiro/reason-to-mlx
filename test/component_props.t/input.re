[@react.component]
let make =
    (
      ~prompt=[%intl.s {js|Filter|js}],
      ~displayMode,
      ~queryText: string,
      ~focusOnMount=?,
      ~delayMs=?,
      ~updateQuery: string => unit,
      ~submitQuery: string => unit,
      ~clearQuery: unit => unit,
    ) => {
  let (queryStatus, setQueryStatus) = ViewRuntime.useStateValue(Idle);
  let delayedQuery = DelayValue.use(queryText, delayMs->Option.getWithDefault(0));
  let visibleQuery = switch (delayMs) {
  | None => queryText
  | Some(_) => delayedQuery
  };
  <FilterField
    prompt
    displayMode
    value=visibleQuery
    ?focusOnMount
    onChange={text => {setQueryStatus(Editing); updateQuery(text)}}
    onSubmit=submitQuery
    onClear=clearQuery
  />;
};
