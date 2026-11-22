let pluralCase = [%intl.s {js|{Count, plural, one {result} other {results}}|js}] @@ { "Count": resultsCount };
