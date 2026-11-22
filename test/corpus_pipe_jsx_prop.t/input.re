let renderSortableHeaders = (sortConfig, onSortColumnClick) =>
  <>
    <Table.HeadCell
      sortDirection=?{sortConfig.direction->Option.some->Option.keep(_ => sortConfig.by == StartDateColumnHeadingText)}
      onSort={onSortColumnClick(StartDateColumnHeadingText)}>
      [%intl.el {js|Start date|js}]
    </Table.HeadCell>
    <Table.HeadCell
      sortDirection=?{sortConfig.direction->Option.some->Option.keep(_ => sortConfig.by == EndDateColumnHeadingText)}
      onSort={onSortColumnClick(EndDateColumnHeadingText)}>
      [%intl.el {js|End date|js}]
    </Table.HeadCell>
  </>;
