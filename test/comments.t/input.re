// File comment
// "
// {|
/* Multi-line
   comment
*/
type state = {
  /* Field comment */
  count: int,
};

let delimiter_edge = /*(*)*/ 1;

let increment = state => {
  let count = state.count + 1; // Updated count
  {...state, count};
};

let view = label =>
  <div>
    /* JSX child comment */
    <span> {React.string(label)} </span>
  </div>;

// Final comment
