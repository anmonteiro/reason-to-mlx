let annotated: /* leads the type */ int = 1;

let f = (x: int): /* leads the return type */ string => string_of_int(x);

type t('a, /* leads b */ 'b) = list(('a, 'b));

type u('a /* trails a */, 'b) = list(('a, 'b));

type v('a /* only */) = list('a);
