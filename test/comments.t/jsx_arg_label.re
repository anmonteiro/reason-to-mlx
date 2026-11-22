let f = () =>
  list->RR.list(
    ~toKey=((_spec, chartProps)) => chartProps##dataKey,
    ~intersperse=<Divider />,
    ((spec, chartProps)) => {
      // Look for compare data - check both complete and incomplete dataKeys
      let compareDataKey = 1;
      compareDataKey;
    },
  );
