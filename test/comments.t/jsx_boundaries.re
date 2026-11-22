let single = () =>
  <div>
    <span />
    /* SINGLE_BETWEEN */
    <span />
  </div>;

let multiple = () =>
  <div>
    <span />
    /* BETWEEN_FIRST */
    // BETWEEN_SECOND
    <span>label</span>
    /* TRAILING_NONEMPTY */
  </div>;

let trailing = () =>
  <div>
    <span />
    /* TRAILING_SELF_CLOSING */
  </div>;

let nested = () =>
  <div>
    /* REPEATED */
    <section>
      <span />
      /* NESTED_BETWEEN */
      <span />
    </section>
    /* REPEATED */
  </div>;
