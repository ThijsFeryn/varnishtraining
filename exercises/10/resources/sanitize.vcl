backend default {
  .host = "localhost";
  .port = "8080";
}
sub vcl_recv {
    set req.http.Host = regsub(req.http.Host, ":[0-9]+", "");

    if (req.url ~ "\#") {
        set req.url = regsub(req.url, "\#.*$", "");
    }

    if (req.url ~ "\?$") {
        set req.url = regsub(req.url, "\?$", "");
    }
    if (req.url ~ "(\?|&)(utm_source|utm_medium|utm_campaign|gclid|cx|ie|cof|siteurl)=") {
        set req.url = regsuball(req.url, "&(utm_source|utm_medium|utm_campaign|gclid|cx|ie|cof|siteurl)=([A-z0-9_\-\.%25]+)", "");
        set req.url = regsuball(req.url, "\?(utm_source|utm_medium|utm_campaign|gclid|cx|ie|cof|siteurl)=([A-z0-9_\-\.%25]+)", "?");
    }
}
sub vcl_deliver {
    set resp.http.x-cache-hits = obj.hits;
    if (obj.hits > 0) {
        set resp.http.x-cache = "hit";
    } else {
        set resp.http.x-cache = "miss";
    }
}