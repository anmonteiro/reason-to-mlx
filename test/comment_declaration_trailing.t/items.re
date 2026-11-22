external a: int => int = "a"; // EXTERNAL_COMMENT
/* BEFORE_B */
external b: int => int = "b";
[@mel.module "react"] external c: int => int = "c"; // ATTRIBUTED_EXTERNAL_COMMENT
exception Foo(string); // EXCEPTION_COMMENT
let after = 1;
