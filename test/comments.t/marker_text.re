let text = "[@reason_to_mlx.comment_0]";
let quoted = {raw|[@reason_to_mlx.comment_0]|raw};
/* TAIL */

/* [@reason_to_mlx.comment_2] */
/* AFTER_MARKER_TEXT */

let documentation = "[@reason_to_mlx.doc_comment_0]";
let quotedDocumentation = {raw|[@@@reason_to_mlx.doc_comment_0]|raw};
/** DOCUMENTED_VALUE */
let value = 1;

/** [@reason_to_mlx.doc_comment_2] */
let first = 2;
/** AFTER_DOC_MARKER_TEXT */
let second = 3;

/* [@reason_to_mlx.doc_comment_3] */
/** DOCUMENTED_RECORD */
type state = {count: int};
