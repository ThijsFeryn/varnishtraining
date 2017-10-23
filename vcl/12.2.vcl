vcl 4.0;
import std;

probe healthcheck {
   .url = "/";
   .interval = 1s;
   .timeout = 1s;
   .window = 3;
   .threshold = 1;
   .initial = 1;
   .expected_response = 200;
}

backend default {
  .host = "127.0.0.1";
  .port = "8080";
  .probe = healthcheck;
}

sub vcl_backend_response {
    if(beresp.http.cache-control ~ "stale-while-revalidate=([0-9]+)") {
        set beresp.http.stale-while-revalidate = regsuball(beresp.http.cache-control, "^.*,? ?stale-while-revalidate=([0-9]+)( ?|,| ,).*$","\1s");
        set beresp.grace = std.duration(beresp.http.stale-while-revalidate,2s);
    }
    if(beresp.http.cache-control ~ "stale-if-error=([0-9]+)") {
        set beresp.http.stale-if-error = regsuball(beresp.http.cache-control, "^.*,? ?stale-if-error=([0-9]+)( ?|,| ,).*$","\1s");
        if(std.duration(beresp.http.stale-if-error,30s) > beresp.grace) {
           set beresp.grace = std.duration(beresp.http.stale-if-error,30s);
        }
    }
}

sub vcl_hit {
    if (obj.ttl >= 0s) {
        return (deliver);
    }

    if (std.healthy(req.backend_hint)) {
        if (obj.ttl + std.duration(obj.http.stale-while-revalidate,2s) > 0s) {
            return (deliver);
        } else {
            return (miss);
        }
    } else {
        if (obj.ttl + std.duration(obj.http.stale-if-error,30s) > 0s) {
            return (deliver);
        } else {
            return (miss);
        }
    }
}

sub vcl_deliver {
  unset resp.http.stale-while-revalidate;
  unset resp.http.stale-if-error;
}