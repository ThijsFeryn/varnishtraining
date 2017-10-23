vcl 4.0;

import std;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    std.timestamp("Before std.log");
    std.log("This should appear in the Shared Memory Log");
    std.timestamp("After std.log");
    std.syslog(9,"This should appear in the Syslog");
    std.timestamp("After std.syslog");
    return(synth(200,"OK"));
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