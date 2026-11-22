  $ ../../main.exe input.re -o input.actual.mlx
  $ diff -u input.mlx input.actual.mlx

  $ printf '// EOF comment' | ../../main.exe
  (* EOF comment *)

Field comments remain attached to their record field.

  $ ../../main.exe field.re -o field.actual.mlx
  $ diff -u field.mlx field.actual.mlx

Nested expression comments remain in the function body.

  $ ../../main.exe nested_expression.re -o nested_expression.actual.mlx
  $ diff -u nested_expression.mlx nested_expression.actual.mlx

JSX child comments stay inside their parent element, not inside the opening
tag. A comment that is the first child leads it. A comment between two
children, or trailing the last one, keeps its own position (see
jsx_boundaries.re below). Leading placement outside JSX - a let-chain, a
match arm, a function parameter - is handled separately; see let_chain.re,
match_arm_gap.re, and param_doc.re below.

  $ ../../main.exe jsx_child.re -o jsx_child.actual.mlx
  $ diff -u jsx_child.mlx jsx_child.actual.mlx

Marker IDs must not match numeric prefixes of other attributes.

  $ ../../main.exe marker_prefix.re | grep -v '^$'
  (* File comment *)
  let (sentinel [@reason_to_mlx.comment_10]) = 0
  let increment value =
    let result = value + 1 (* Nested comment *) in
    result

Final formatting must not drop comments between JSX siblings.

  $ ../../main.exe jsx_siblings.re -o jsx_siblings.actual.mlx
  $ diff -u jsx_siblings.mlx jsx_siblings.actual.mlx

Comments on ordinary list elements must not create cyclic printer input. A
comment leading the first element stays inside the brackets, leading that
element, the same as a comment leading any later element (see
list_element_lead.re above).

  $ ../../main.exe list_comment.re -o list_comment.actual.mlx
  $ diff -u list_comment.mlx list_comment.actual.mlx

Comments after JSX expressions must not attach to tuple or extension wrappers.

  $ ../../main.exe jsx_trailing.re -o jsx_trailing.actual.mlx
  $ diff -u jsx_trailing.mlx jsx_trailing.actual.mlx

Comments retain their order and their source position between JSX children,
even several levels deep, as `NESTED_BETWEEN` shows inside `<section>`. In
`nested`, the first `REPEATED` comment leads `<section>`, the outer `<div>`'s
only child, and the second one trails it.

  $ ../../main.exe jsx_boundaries.re | grep -v '^$'
  let single () = <div><span /> (* SINGLE_BETWEEN *) <span /></div>
  let multiple () =
    <div>
      <span />
      (* BETWEEN_FIRST *)
      (* BETWEEN_SECOND *)
      <span>label</span>
      (* TRAILING_NONEMPTY *)
    </div>
  let trailing () = <div><span /> (* TRAILING_SELF_CLOSING *) </div>
  let nested () =
    <div>
      (* REPEATED *)
      <section><span /> (* NESTED_BETWEEN *) <span /></section>
      (* REPEATED *)
    </div>

A comment between two children of a component that also carries props stays
in place, the same as jsx_boundaries.re's `single`, not pulled all the way
past a later sibling and forced to trail it.

  $ ../../main.exe jsx_sibling_with_props.re -o jsx_sibling_with_props.actual.mlx
  $ diff -u jsx_sibling_with_props.mlx jsx_sibling_with_props.actual.mlx

Comments remain inside their module and match branch.

  $ ../../main.exe nested_scope.re | grep -v '^$'
  module Empty = struct
    (* EMPTY_MODULE *)
  end
  module Nested = struct
    (* NESTED_HEADER *)
    let value = 1
    (* NESTED_TRAILING *)
  end
  let choose flag =
    match flag with
    | true -> 1
    | false -> (* FALSE_BRANCH *) 2

Extension payloads must not capture comments from later functions.

  $ ../../main.exe extension_scope.re | grep -v '^$'
  [%%raw "const x = 1;"]
  let f () = (* FUNCTION_BODY *) 1
  module Nested = struct
    [%%raw "const y = 2;"]
    let g () = (* NESTED_FUNCTION_BODY *) 2
  end

Marker-looking text in literals and comments is source data.

  $ ../../main.exe marker_text.re | grep -v '^$'
  let text = "[@reason_to_mlx.comment_0]"
  let quoted = {raw|[@reason_to_mlx.comment_0]|raw}
  (* TAIL *)
  (* [@reason_to_mlx.comment_2] *)
  (* AFTER_MARKER_TEXT *)
  let documentation = "[@reason_to_mlx.doc_comment_0]"
  let quotedDocumentation = {raw|[@@@reason_to_mlx.doc_comment_0]|raw}
  (** DOCUMENTED_VALUE *)
  let value = 1
  (** [@reason_to_mlx.doc_comment_2] *)
  let first = 2
  (** AFTER_DOC_MARKER_TEXT *)
  let second = 3
  (* [@reason_to_mlx.doc_comment_3] *)
  (** DOCUMENTED_RECORD *)
  type state = { count : int }

A comment between two match cases documents the next case (fragment or plain
element body), not the previous one's last JSX element.

  $ ../../main.exe match_case_gap.re -o match_case_gap.actual.mlx
  $ diff -u match_case_gap.mlx match_case_gap.actual.mlx

A comment before the first attribute, or between attributes, stays inside
the opening tag: it was there in the source, and nothing else borders it.
This is a DOM tag (a lowercase name, such as `div`); jsx_prop_gap_first.re
below covers the same position for a component tag (an uppercase name),
which the converter treats differently.

  $ ../../main.exe attribute_comment.re -o attribute_comment.actual.mlx
  $ diff -u attribute_comment.mlx attribute_comment.actual.mlx

A comment inside a `{...}` expression child stays with that expression.

  $ ../../main.exe expression_child.re -o expression_child.actual.mlx
  $ diff -u expression_child.mlx expression_child.actual.mlx

Known gap: a comment that is the *only* child of an element still prints
inside the opening tag, because there is no first real child to relocate it
next to (see the leading-first-child gap documented above).

  $ ../../main.exe only_child.re -o only_child.actual.mlx
  $ diff -u only_child.mlx only_child.actual.mlx

A comment between two chained let-bindings documents the next binding, not
the previous one's value.

  $ ../../main.exe let_chain.re -o let_chain.actual.mlx
  $ diff -u let_chain.mlx let_chain.actual.mlx

A comment between two match cases (non-JSX bodies) documents the next arm,
not the previous one's value.

  $ ../../main.exe match_arm_gap.re -o match_arm_gap.actual.mlx
  $ diff -u match_arm_gap.mlx match_arm_gap.actual.mlx

A comment between two modules documents the next module, not the previous
one's last item.

  $ ../../main.exe module_boundary.re -o module_boundary.actual.mlx
  $ diff -u module_boundary.mlx module_boundary.actual.mlx

A comment before a record-update field stays with that field.

  $ ../../main.exe record_update_field.re -o record_update_field.actual.mlx
  $ diff -u record_update_field.mlx record_update_field.actual.mlx

JSX comments between siblings and as the last child keep their position even
when the element also has an attribute.

  $ ../../main.exe jsx_siblings_attrs.re -o jsx_siblings_attrs.actual.mlx
  $ diff -u jsx_siblings_attrs.mlx jsx_siblings_attrs.actual.mlx

A comment with a balanced (even) number of quotes is preserved verbatim. An
odd count is doubled instead, because the OCaml lexer tracks quoted strings
inside a comment too, and a lone quote there would break the lexer on the
code that follows.

  $ ../../main.exe quotes.re -o quotes.actual.mlx
  $ diff -u quotes.mlx quotes.actual.mlx

A comment before a function's first parameter stays with that parameter and
prints inline, right after the function name.

  $ ../../main.exe param_doc.re -o param_doc.actual.mlx
  $ diff -u param_doc.mlx param_doc.actual.mlx

A comment before a let-chain's final, non-`let` body documents that body,
not the last binding's value.

  $ ../../main.exe let_body.re -o let_body.actual.mlx
  $ diff -u let_body.mlx let_body.actual.mlx

An or-pattern case (`| B | C -> ...`) leads with the comment before its own
`|`, not the `|` joining its two alternatives.

  $ ../../main.exe or_pattern.re -o or_pattern.actual.mlx
  $ diff -u or_pattern.mlx or_pattern.actual.mlx

A comment before any parameter is claimed, not just the first, and even
when it shares a line with the function name (parameters have no "own
line" requirement, unlike a let-chain or match arm, since they always
print inline).

  $ ../../main.exe params.re -o params.actual.mlx
  $ diff -u params.mlx params.actual.mlx

A comment attached to a JSX value used as a labelled call argument (not a
JSX child) moves ahead of the next argument instead of trailing that value,
ending up as the next callback body's first line.

  $ ../../main.exe jsx_arg_label.re -o jsx_arg_label.actual.mlx
  $ diff -u jsx_arg_label.mlx jsx_arg_label.actual.mlx

A same-line trailing comment right after a labelled JSX argument stays
trailing that argument, and the argument keeps its label.

  $ ../../main.exe jsx_arg_label_same_line.re -o jsx_arg_label_same_line.actual.mlx
  $ diff -u jsx_arg_label_same_line.mlx jsx_arg_label_same_line.actual.mlx

A comment before a record type's first field used to land on the type's
last type parameter (the nearest preceding node): attaching an attribute
there forces parens around a bare type variable, which is not valid syntax
inside a type parameter list at all, breaking conversion outright rather
than just misplacing the comment.

  $ ../../main.exe record_first_field.re -o record_first_field.actual.mlx
  $ diff -u record_first_field.mlx record_first_field.actual.mlx

The same bug, for a variant type's first constructor.

  $ ../../main.exe variant_first_constructor.re -o variant_first_constructor.actual.mlx
  $ diff -u variant_first_constructor.mlx variant_first_constructor.actual.mlx

A comment before a `let name : type a. ty = expr` binding (a locally
abstract type / GADT-style annotation) cannot sit on that binding's own
pattern, since an attribute would parenthesize `name`. It leads the whole
`let` expression instead and stays above the binding.

  $ ../../main.exe locally_abstract_type.re -o locally_abstract_type.actual.mlx
  $ diff -u locally_abstract_type.mlx locally_abstract_type.actual.mlx

A comment on its own line between two JSX props leads the next prop. After a
prop whose own value is JSX, e.g. `logoEl={<Img />}`, the printer would put
the comment inside that value's parentheses, so it goes ahead of the next
prop's value instead.

  $ ../../main.exe jsx_prop_gap.re -o jsx_prop_gap.actual.mlx
  $ diff -u jsx_prop_gap.mlx jsx_prop_gap.actual.mlx

A JSX-valued prop that is itself the last one keeps the comment before it.

  $ ../../main.exe jsx_prop_gap_last.re -o jsx_prop_gap_last.actual.mlx
  $ diff -u jsx_prop_gap_last.mlx jsx_prop_gap_last.actual.mlx

A comment on its own line before the FIRST prop of a component (uppercase
tag) stays right after the tag, before that prop.

  $ ../../main.exe jsx_prop_gap_first.re -o jsx_prop_gap_first.actual.mlx
  $ diff -u jsx_prop_gap_first.mlx jsx_prop_gap_first.actual.mlx

A prop the printer PUNS (`label=identifier` with the identifier named the
same as the label, printed as bare `label`) keeps the comment before it. The
printer spells the prop `url=url` so the comment has a place to sit.

  $ ../../main.exe jsx_prop_pun.re -o jsx_prop_pun.actual.mlx
  $ diff -u jsx_prop_pun.mlx jsx_prop_pun.actual.mlx

Several own-line comments leading the SAME target keep their source order,
whatever shape that target is: a match case, a let-chain binding, a record
field, a variant constructor, a list element, or a function parameter.

  $ ../../main.exe stacked_match_case.re -o stacked_match_case.actual.mlx
  $ diff -u stacked_match_case.mlx stacked_match_case.actual.mlx

  $ ../../main.exe stacked_let_chain.re -o stacked_let_chain.actual.mlx
  $ diff -u stacked_let_chain.mlx stacked_let_chain.actual.mlx

  $ ../../main.exe stacked_let_body.re -o stacked_let_body.actual.mlx
  $ diff -u stacked_let_body.mlx stacked_let_body.actual.mlx

  $ ../../main.exe stacked_record_field.re -o stacked_record_field.actual.mlx
  $ diff -u stacked_record_field.mlx stacked_record_field.actual.mlx

  $ ../../main.exe stacked_variant_constructor.re -o stacked_variant_constructor.actual.mlx
  $ diff -u stacked_variant_constructor.mlx stacked_variant_constructor.actual.mlx

  $ ../../main.exe stacked_list_element.re -o stacked_list_element.actual.mlx
  $ diff -u stacked_list_element.mlx stacked_list_element.actual.mlx

  $ ../../main.exe stacked_parameter.re -o stacked_parameter.actual.mlx
  $ diff -u stacked_parameter.mlx stacked_parameter.actual.mlx

A commented-out multi-line code block is just several stacked own-line
comments.

  $ ../../main.exe stacked_commented_code.re -o stacked_commented_code.actual.mlx
  $ diff -u stacked_commented_code.mlx stacked_commented_code.actual.mlx

A comment before a list, tuple, or record-literal element documents that
element too, not the previous one's value - the same rule, extended to
expression-level collections. A record UPDATE's fields (`{...base, field: v}`)
already had their own correct leading behaviour (see record_update_field.re
above, which leads the whole `field =`); a plain record literal has no
separate label to lead instead, so it leads the value, same as a list or
tuple element.

A list keeps its `[a; b; c]` sugar without attaching an attribute to any
real element: it splices a marker element into the chain at the comment's
own index instead, then replaces that marker with the comment in the final
output. Stacked comments become consecutive marker elements, restored in
source order the same way as every other stacked shape above. A JSX
element's own `children` list uses a different mechanism (relocating to
the last child, described above), so list markers skip it.

  $ ../../main.exe list_element_lead.re -o list_element_lead.actual.mlx
  $ diff -u list_element_lead.mlx list_element_lead.actual.mlx

A list of records is the same list mechanism regardless of what the
elements are; the comment leads the record, not one of its own fields.

  $ ../../main.exe list_of_records_lead.re -o list_of_records_lead.actual.mlx
  $ diff -u list_of_records_lead.mlx list_of_records_lead.actual.mlx

Tuples and record literals keep their ordinary syntax throughout; a list
keeps its brackets too, via the marker-element mechanism above instead of
an attribute.

  $ ../../main.exe tuple_element_lead.re -o tuple_element_lead.actual.mlx
  $ diff -u tuple_element_lead.mlx tuple_element_lead.actual.mlx

  $ ../../main.exe record_element_lead.re -o record_element_lead.actual.mlx
  $ diff -u record_element_lead.mlx record_element_lead.actual.mlx

A comment before a variant's constructor, or a record type's field, at any
position - not just the first, which variant_first_constructor.re and
record_first_field.re already covered - leads that constructor/field.

  $ ../../main.exe type_decl_later_element.re -o type_decl_later_element.actual.mlx
  $ diff -u type_decl_later_element.mlx type_decl_later_element.actual.mlx

A comment right after a match case's own pattern (or guard) - before its
OWN body, not before the next case's pattern - documents that body. This
holds for every case, guarded or not, or-pattern or not.

  $ ../../main.exe match_case_body_lead.re -o match_case_body_lead.actual.mlx
  $ diff -u match_case_body_lead.mlx match_case_body_lead.actual.mlx

A JSX element or fragment that carries an attribute besides `[@JSX]` - a
keyword object-field value needing the `\#and` raw-identifier escape, or a
doc comment on the returned JSX - still converts: children get `<Tag>` sugar,
the fragment stays `<>...</>`, and a real
attribute (not a doc comment) prints trailing the element. A doc comment has
no documentable position on a bare JSX expression, so it prints as a leading
`(* ... *)` instead, same as before any other non-let expression statement.

  $ ../../main.exe jsx_extra_attribute.re -o jsx_extra_attribute.actual.mlx
  $ diff -u jsx_extra_attribute.mlx jsx_extra_attribute.actual.mlx

A fragment's own children (`<>a b</>`) get the same comment handling as a
component or DOM tag's children: a comment before any child but the first
stays right where it was, between the preceding child and this one.

  $ ../../main.exe jsx_fragment_last_child.re -o jsx_fragment_last_child.actual.mlx
  $ diff -u jsx_fragment_last_child.mlx jsx_fragment_last_child.actual.mlx

  $ ../../main.exe jsx_child_with_props.re -o jsx_child_with_props.actual.mlx
  $ diff -u jsx_child_with_props.mlx jsx_child_with_props.actual.mlx

A let-chain's final body, or a match case's own body (see
`match_case_body_lead.re` above), can itself be a JSX element. A let-chain
keeps the comment leading that body, on its own line before the JSX. A
match case's own JSX body has no enclosing `let` to lead, so the comment
trails the case body instead.

  $ ../../main.exe jsx_returned_element.re -o jsx_returned_element.actual.mlx
  $ diff -u jsx_returned_element.mlx jsx_returned_element.actual.mlx

No blank line is inserted between the comment and the JSX body it leads,
even for a multi-line comment, even when the JSX carries props, and even
when a blank line in the source separates the comment from the previous
binding: that blank line stays above the comment instead of moving below
it.

  $ ../../main.exe let_body_jsx_multiline.re -o let_body_jsx_multiline.actual.mlx
  $ diff -u let_body_jsx_multiline.mlx let_body_jsx_multiline.actual.mlx

  $ ../../main.exe jsx_switch_case_body.re -o jsx_switch_case_body.actual.mlx
  $ diff -u jsx_switch_case_body.mlx jsx_switch_case_body.actual.mlx

Every fixture's converter output must also be stable under ocamlformat-mlx:
reformatting it must reproduce the same text, with no error. ocamlformat-mlx
keeps a JSX child comment stable wherever it sits, including before the
first child.

Every comment collected from the source must also occur, whitespace and
quotes aside, somewhere in the final output - whatever mechanism carried
it there. A dropped comment still leaves valid syntax behind, so nothing
else in this pipeline would catch it; this check does.

  $ for f in *.re; do
  >   ../../main.exe "$f" -o rt_out.mlx 2>rt_err.log \
  >     || { echo "CONVERTER ERROR on $f:"; cat rt_err.log; continue; }
  >   ocamlformat-mlx --enable-outside-detected-project rt_out.mlx \
  >     > rt_fmt.mlx 2>rt_fmt_err.log \
  >     || { echo "FORMATTER ERROR on $f:"; cat rt_fmt_err.log; continue; }
  >   diff rt_out.mlx rt_fmt.mlx > /dev/null \
  >     || { echo "ROUND-TRIP DIFF on $f:"; diff rt_out.mlx rt_fmt.mlx; }
  > done
  $ rm -f rt_out.mlx rt_fmt.mlx rt_err.log rt_fmt_err.log
