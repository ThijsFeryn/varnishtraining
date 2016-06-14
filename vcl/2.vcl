vcl 4.0;

backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

sub vcl_backend_response {
    set beresp.ttl = 3s;
}