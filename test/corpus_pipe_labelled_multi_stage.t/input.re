let groupedEntries = entries =>
  entries
  ->List.toArray
  ->Array.groupBy(
      ~key=({ date: entryDate, _ }) => entryDate->MomentUtils.fromStringUtc->MomentUtils.formatRaw("YYYY-MM-DD"),
      ~compare=String.compare,
    )
  ->Array.map(((entryDate, changes)) =>
      (entryDate, changes->List.fromArray->List.map(({ change: changeValue, commit: commitInfo, _ }) => (changeValue, commitInfo)))
    )
  ->List.fromArray
  ->List.sort(((dateA, _), (dateB, _)) => {
      let a = MomentUtils.fromStringUtc(dateA);
      let b = MomentUtils.fromStringUtc(dateB);
      MomentUtils.Compare.isAfter(a, b) ? (-1) : 1;
    });
