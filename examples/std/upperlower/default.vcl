vcl 4.0;

import std;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    return(synth(200,std.toupper("yes") + " " + std.tolower("YES")));
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