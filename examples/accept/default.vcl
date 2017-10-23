vcl 4.0;

import accept;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_init {
        new language = accept.rule("en");
        language.add("nl");

        new encoding = accept.rule("deflate");
        language.add("gzip");

        new contenttype = accept.rule("text/plain");
        contenttype.add("text/html");
        contenttype.add("application/json");
}

sub vcl_recv {
    set req.http.Accept-Language = language.filter(req.http.Accept-Language);
    set req.http.Accept-Encoding = encoding.filter(req.http.Accept-Encoding);
    set req.http.Accept = contenttype.filter(req.http.Accept);
}