vcl 4.0;

acl purgers {
    "172.18.0.0"/24;
}

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    if (req.method == "PURGE") {
        if (client.ip !~ purgers) {
            return (synth(405, "Method not allowed"));
        }
        if(req.http.x-purge-regex) {
            ban("obj.http.x-host == " + req.http.host + " && obj.http.x-url ~ " + req.http.x-purge-regex);
        } else {
            ban("obj.http.x-host == " + req.http.host + " && obj.http.x-url == " + req.url);
        }
        return (synth(200, "Purged"));
    }
}

sub vcl_backend_response {
  set beresp.http.x-url = bereq.url;
  set beresp.http.x-host = bereq.http.host;
}

sub vcl_deliver {
  unset resp.http.x-url;
  unset resp.http.x-host;
}