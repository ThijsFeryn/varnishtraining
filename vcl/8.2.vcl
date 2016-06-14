vcl 4.0;

backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

sub vcl_recv {
    if(req.method == "PURGE") {
        ban("req.http.host == " + req.http.host + " && req.url == " + req.url);
        return(synth(200, "Ban added"));
    }
}