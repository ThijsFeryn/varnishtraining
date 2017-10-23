vcl 4.0;

import cookie;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    if (req.http.cookie) {
        cookie.parse(req.http.cookie);
        cookie.filter_except("SESSIONID,PHPSESSID");
        set req.http.cookie = cookie.get_string();
        if (req.http.cookie == "") {
            unset req.http.cookie;
        }
    }

    if(cookie.isset("PHPSESSID")) {
        return(synth(200,"Cookies: <em>"+req.http.cookie+"</em>, PHPSESSID is set and contains the following value: <em>" + cookie.get("PHPSESSID") + "</em>"));
    }

    return(synth(200,"Cookies: <em>"+req.http.cookie+"</em>, PHPSESSID is not set"));
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