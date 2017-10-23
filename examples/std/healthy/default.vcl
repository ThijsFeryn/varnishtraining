vcl 4.0;

import std;

backend default {
    .host = "nginx";
    .port = "80";
    .probe = {
    .url = "/";
        .interval  = 1s;
        .timeout   = 1s;
        .window    = 5;
        .threshold = 3;
    }
}

sub vcl_recv {
    if(std.healthy(req.backend_hint)) {
        return(synth(200,"Backend is healthy"));
    } else {
        return(synth(200,"Backend is unhealthy"));
    }

}
sub vcl_synth {
    set resp.http.Content-Type = "text/html; charset=utf-8";
    set resp.http.Retry-After = "5";
    synthetic( {"<!DOCTYPE html>
<html>
  <head>
    <title>"} + resp.status + " " + resp.reason + {"</title>
  </head>
  <body>
  "} + resp.reason + {"
  </body>
</html>
"} );
    return (deliver);
}