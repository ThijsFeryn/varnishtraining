vcl 4.0;

import std;


backend nginx {
    .host = "nginx";
    .port = "80";
}

backend nginx2 {
    .host = "nginx2";
    .port = "80";
}

backend varnish {
    .host = "varnish";
    .port = "6080";
}

backend varnish2 {
    .host = "varnish2";
    .port = "6080";
}

sub vcl_recv {
    if(std.getenv("SERVER") == "primary") {
        if(std.port(server.ip) == 6080) {
            set req.backend_hint = nginx;
            set req.http.x-esi = "yes";
            std.log("Varnish is connecting to Nginx");
        } else {
            set req.backend_hint = varnish2;
            set req.http.x-esi = "no";
            std.log("Varnish is connecting to Varnish 2");
        }
    } else {
        if(std.port(server.ip) == 6080) {
            set req.backend_hint = nginx2;
            set req.http.x-esi = "yes";
            std.log("Varnish 2 is connecting to Nginx 2");
        } else {
            set req.backend_hint = varnish;
            set req.http.x-esi = "no";
            std.log("Varnish 2 is connecting to Varnish ");
        }
    }
}

sub vcl_backend_response {
    if (bereq.http.x-esi == "yes" && beresp.http.Surrogate-Control ~ "ESI/1.0") {
        unset beresp.http.Surrogate-Control;
        set beresp.do_esi = true;
    }
}