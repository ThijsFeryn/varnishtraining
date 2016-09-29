vcl 4.0;

import directors;

backend nginx {
  .host = "127.0.0.1";
  .port = "8081";
}

backend nginx2 {
  .host = "127.0.0.1";
  .port = "8082";
}

sub vcl_init {
    new loadbalance = directors.hash();
    loadbalance.add_backend(nginx,1.0);
    loadbalance.add_backend(nginx2,1.0);
}

sub vcl_recv {
    set req.backend_hint = loadbalance.backend(regsuball(req.http.Cookie, "^.*;? ?PHPSESSID=([a-zA-Z0-9]+)( ?|;| ;).*$","\1"));
    return(pass);
}
