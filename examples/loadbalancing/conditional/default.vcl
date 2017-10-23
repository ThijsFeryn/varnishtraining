vcl 4.0;

import std;

probe web {
    .url = "/";
    .interval  = 5s;
    .timeout   = 1s;
    .window    = 5;
    .threshold = 3;
}

backend nginx {
    .host = "nginx";
    .port = "80";
    .probe = web;
}

backend nginx2 {
    .host = "nginx2";
    .port = "80";
    .probe = web;
}


sub vcl_recv {
  if(req.url ~ "^/products") {
    set req.backend_hint = nginx;
  } else {
    set req.backend_hint = nginx2;
  }
}
