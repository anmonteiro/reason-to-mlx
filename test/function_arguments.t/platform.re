let value =
  switch%platform (Runtime.platform) {
  | Melange => "client"
  | Native => "server"
  };
