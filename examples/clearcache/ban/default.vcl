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
            ban("req.http.host == " + req.http.host + " && req.url ~ " + req.http.x-purge-regex);
        } else {
            ban("req.http.host == " + req.http.host + " && req.url == " + req.url);
        }
        return (synth(200, "Purged"));
    }
}