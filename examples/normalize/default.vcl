vcl 4.0;

import accept;
import std;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_init {
        new language = accept.rule("en");
        language.add("nl");

        new encoding = accept.rule("");
        language.add("deflate");
        language.add("gzip");

        new contenttype = accept.rule("text/plain");
        contenttype.add("text/html");
        contenttype.add("application/json");
}

sub vcl_recv {

    set req.http.Accept-Language = language.filter(req.http.Accept-Language);
    set req.http.Accept-Encoding = encoding.filter(req.http.Accept-Encoding);
    set req.http.Accept = contenttype.filter(req.http.Accept);

    if (req.http.User-Agent ~ "MSIE 6" || req.http.Accept-Encoding ~ "^\s*$") {
        unset req.http.Accept-Encoding;
    }

    set req.http.Host = regsub(req.http.Host, ":[0-9]+", "");
    set req.url = std.querysort(req.url);

    if (req.url ~ "(\?|&)(utm_source|utm_medium|utm_campaign|utm_content|gclid|cx|ie|cof|siteurl)=") {
        set req.url = regsuball(req.url, "&(utm_source|utm_medium|utm_campaign|utm_content|gclid|cx|ie|cof|siteurl)=([A-z0-9_\-\.%25]+)", "");
        set req.url = regsuball(req.url, "\?(utm_source|utm_medium|utm_campaign|utm_content|gclid|cx|ie|cof|siteurl)=([A-z0-9_\-\.%25]+)", "?");
        set req.url = regsub(req.url, "\?&", "?");
        set req.url = regsub(req.url, "\?$", "");
    }

    if (req.url ~ "\#") {
        set req.url = regsub(req.url, "\#.*$", "");
    }

    if (req.url ~ "\?$") {
        set req.url = regsub(req.url, "\?$", "");
    }
}