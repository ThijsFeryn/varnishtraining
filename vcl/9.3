vcl 4.0;

import std;

backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

sub vcl_recv {
    std.log("Receving it");
}

sub vcl_pass{
    std.log("We passed");
}

sub vcl_hit{
    std.log("We hit");
}

sub vcl_miss{
    std.log("We missed");
    std.syslog(9, "MISS on http://"+req.http.host+req.url);
}

sub vcl_backend_error{
    std.syslog(9, "Backend error for http://"+bereq.http.host+bereq.url+" on backend "+beresp.backend.name+": HTTP "+beresp.status+": "+beresp.reason);
}