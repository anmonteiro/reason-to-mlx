Signature items at the top level (an interface file, following interface.t's
own `cp` convention) and inside a nested `module Nested: { ... }`, with a
blank line present between some siblings and absent between others. A
comment before `finalVal` adds the same check: no blank before it, one
after.

  $ cp input.re input.rei
  $ ../../main.exe input.rei -o actual.mli
  $ diff -u output.mli actual.mli
