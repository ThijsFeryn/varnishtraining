vcl 4.0;

import accept;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_init {
        new language = accept.rule("en");
        language.add("nl");
}

sub vcl_recv {
    set req.http.Accept-Language = language.filter(req.http.Accept-Language);
}