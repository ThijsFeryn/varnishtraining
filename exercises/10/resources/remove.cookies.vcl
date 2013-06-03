backend default {
  .host = "localhost";
  .port = "8080";
}
sub vcl_recv {
    unset req.http.cookie;
}
sub vcl_fetch {
    unset beresp.http.set-cookie;
}
sub vcl_deliver {
    set resp.http.x-cache-hits = obj.hits;
    if (obj.hits > 0) {
        set resp.http.x-cache = "hit";
    } else {
        set resp.http.x-cache = "miss";
    }
}