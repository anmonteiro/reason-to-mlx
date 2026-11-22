let view = items =>
  <div>
    {
      // Comment about the mapping.
      items->Belt.Array.map(item => item)
    }
  </div>;
