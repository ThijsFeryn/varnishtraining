vcl 4.0;

import std;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_deliver {
    set resp.http.x-header = "12";
    if(std.integer(resp.http.x-header,5) > 10) {
        return(synth(200,"Header is bigger than 10, value:" + resp.http.x-header));
    }
    return(synth(200,"Header is NOT bigger than 10, value:" + resp.http.x-header));

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