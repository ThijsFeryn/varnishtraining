vcl 4.0;

backend default {
  .host = "localhost";
  .port = "8080";
}
sub vcl_recv {
    set req.http.Surrogate-Capability="key=ESI/1.0";
}
sub vcl_backend_response {
	if(beresp.http.Surrogate-Control~"ESI/1.0") {
        unset beresp.http.Surrogate-Control;
	    set beresp.do_esi=true;
	    return(deliver);
    }
}