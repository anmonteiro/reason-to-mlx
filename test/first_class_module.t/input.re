let bucketBy = (type entry, entries, ~key, ~compare) => {
  let compareEntries: (entry, entry) => int = compare;
  let (module Ordering) = CollectionId.comparable(~cmp=compareEntries);
  let initial = OrderedMap.make(~id=(module Ordering));
  let addEntry = newEntry =>
    fun
    | None => Some([newEntry])
    | Some(existingEntries) => Some([newEntry, ...existingEntries]);
  fold(entries, initial, (map, entry) => OrderedMap.update(map, key(entry), addEntry(entry)))
  ->(OrderedMap.map(List.toArray))
  ->OrderedMap.toArray;
};
