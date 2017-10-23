vcl 4.0;

acl refreshers {
    "172.18.0.0"/24;
    "localhost";
}

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    if (req.method == "REFRESH") {
        if (client.ip !~ refreshers) {
            return (synth(405, "Method not allowed"));
        }
        set req.method = "GET";
        set req.hash_always_miss = true;
    }
}