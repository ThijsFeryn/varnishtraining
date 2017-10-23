vcl 4.0;

import cookie;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
  if (req.http.cookie) {
      cookie.parse(req.http.cookie);
      cookie.filter_except("language");
      set req.http.cookie = cookie.get_string();
      if (req.http.cookie ~ "^\s*$") {
          unset req.http.cookie;
      }
      return(hash);
  }
}

sub vcl_hash {
    hash_data(cookie.get("language"));
}