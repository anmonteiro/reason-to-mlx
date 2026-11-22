let a = items->Array.groupBy(
    // K1 endure that the key has the minAvailableDate
    // K2 for example if minAvailableDate=Jan 2nd, and the granularity=Monthly,
    // K3 we want to use Jan 2nd in our mapping not the getStartOfMonthMoment(Jan 1st)
    ~key=note => note->getDate->toReferenceKey(~granularity),
    ~compare=String.compare,
  );
