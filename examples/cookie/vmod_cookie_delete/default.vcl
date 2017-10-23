vcl 4.0;

import cookie;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    if (req.http.cookie) {
        cookie.parse(req.http.cookie);
        cookie.delete("cookie2");
        set req.http.cookie = cookie.get_string();
        if (req.http.cookie == "") {
            unset req.http.cookie;
        }
    }
    return(synth(200,"Cookies: "+req.http.cookie));
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