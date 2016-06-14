vcl 4.0;

backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

acl purge {
    "127.0.0.1";
}

sub vcl_recv {
    if(req.method == "PURGE") {
        if(!client.ip ~ purge) {
            return(synth(405,"Not allowed"));
        }
        ban("obj.http.x-host == " + req.http.host + " && obj.http.x-url == " + req.url);
        return(synth(200, "Ban added"));
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