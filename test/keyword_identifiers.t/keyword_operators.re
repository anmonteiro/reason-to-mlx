let bits = (a, b) => a mod b + (a land b) + (a lor b) + (a lxor b) + (a lsl 1) + (a lsr 1) + (a asr 1);
let effect = 1;
let sum = effect mod 2;
