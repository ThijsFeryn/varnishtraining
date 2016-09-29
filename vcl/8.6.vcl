vcl 4.0;
import xkey;

backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

sub vcl_recv {
    if(req.method == "PURGE" && req.http.key) {
        set req.http.x-gone = xkey.purge(req.http.key);
        return (synth(200, "Invalidated "+req.http.x-gone+" objects"));
    }
}