vcl 4.0;

import std;

backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

sub vcl_recv {
    set req.url = std.querysort(req.url);
}