vcl 4.0;

import std;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    if(std.file_exists("/etc/varnish/file.txt")) {
        return(synth(200,std.fileread("/etc/varnish/file.txt")));
    } else {
        return(synth(200,"File does not exist"));
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