vcl 4.0;

acl purgers {
    "172.18.0.0"/24;
    "localhost";
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
        return (purge);
    }
}