vcl 4.0;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    set req.http.Surrogate-Capability = "key=ESI/1.0";
    if (req.esi_level > 0) {
        set req.http.x-parent-url = req_top.url;
    }
}

sub vcl_backend_response {
    if (beresp.http.Surrogate-Control ~ "ESI/1.0") {
        unset beresp.http.Surrogate-Control;
        set beresp.do_esi = true;
    }
}