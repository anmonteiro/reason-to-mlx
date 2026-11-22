let digestHex: string => AsyncValue.t(string) = [%mel.raw
  {|
  function (message) {
    var encoded = new TextEncoder().encode(message);
    return crypto.subtle.digest("SHA-256", encoded).then(function (bytes) {
      return Array.prototype.map
        .call(new Uint8Array(bytes), function (octet) {
          return octet.toString(16).padStart(2, "0");
        })
        .join("");
    });
  }
|}
];
