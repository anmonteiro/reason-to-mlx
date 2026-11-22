[@react.component]
let make =
    (
      ~kind: kind,
      ~label: string,
      /* Narrows the options, with a key to refetch on. */
      ~where: option(Q.Dimension.Filter.t)=?,
      ~whereKey: string="",
      ~customerId: option(string),
      ~timerange: Gads_query.timerange,
      ~timerangeKey: string,
      ~selected: list(selection),
      ~onChange: list(selection) => unit,
    ) => {
  <div />;
};

module CategoryRow = {
  [@react.component]
  let make =
      (
        ~onCategoriesChange: (int, list(string)) => unit,
        ~onMatchTypeChange: (int, ProductCatalogueFilters.ContentCategory.contentCategoryMatchType) => unit,
        ~onMatchModeChange: (int, TextFilter_t.matchType) => unit,
        // Shows the scope select before the operator
        ~showScope: bool,
        ~onScopeChange: (int, ProductCatalogueFilters.ContentCategory.categoryScope) => unit,
        ~onRuleDelete: unit => unit,
      ) => {
    <div />;
  };
};
