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
    new loadbalance = directors.round_robin();
    loadbalance.add_backend(nginx);
    loadbalance.add_backend(nginx2);
}

sub vcl_recv {
    set req.backend_hint = loadbalance.backend();
    return(pass);
}
