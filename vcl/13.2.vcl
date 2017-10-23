vcl 4.0;

backend default {
  .host = "localhost";
  .port = "8080";
}
sub vcl_recv {
    set req.http.Surrogate-Capability="key=ESI/1.0";
    if ((req.method != "GET" && req.method != "HEAD") || req.http.Authorization) {
        return (pass);
    }
    return(hash);
}
sub vcl_backend_response {
	if(beresp.http.Surrogate-Control~"ESI/1.0") {
        unset beresp.http.Surrogate-Control;
	    set beresp.do_esi=true;
	    return(deliver);
    }
}