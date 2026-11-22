let spawn = (content, flag) =>
  if (flag) {
    // chips is non-empty here, and modulo keeps the index in bounds.
    let item = content->get();
    use(item);
  };
