let each = items => items->Js.Array.forEachi(~f=(item, index) => ignore((item, index)));
