let sharedValues = { "Tool": toolName };
let x = [%intl.s {js|{Tool} helps you|js}] @@ sharedValues;
let y = sharedValues;
