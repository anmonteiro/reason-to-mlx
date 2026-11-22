let increment = state => {
  let count = state.count + 1; // Nested expression comment
  {...state, count};
};
