vcl 4.0;

import directors;

backend nginx {
  .host = "127.0.0.1";
  .port = "8080";
}

backend nginx2 {
  .host = "127.0.0.1";
  .port = "8081";
}

sub vcl_init {
    new loadbalance = directors.hash();
    loadbalance.add_backend(nginx,1.0);
    loadbalance.add_backend(nginx2,1.0);
}

sub vcl_recv {
    set req.backend_hint = loadbalance.backend(client.ip);
    return(pass);
}