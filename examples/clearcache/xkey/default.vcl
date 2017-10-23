vcl 4.0;

import xkey;

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
            return (synth(405, "Method now allowed"));
        }
        set req.http.n-gone = xkey.purge(req.http.key);
        return (synth(200, "Invalidated "+req.http.n-gone+" objects for key "+ req.http.key));
    }
    if (req.method == "SOFTPURGE") {
        if (client.ip !~ purgers) {
            return (synth(405, "Method not allowed"));
        }
        set req.http.n-gone = xkey.softpurge(req.http.key);
        return (synth(200, "Invalidated "+req.http.n-gone+" objects via softpurge for key "+ req.http.key));
    }
}