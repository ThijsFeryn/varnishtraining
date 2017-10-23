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
    new loadbalancerr = directors.round_robin();
    loadbalancerr.add_backend(nginx);
    loadbalancerr.add_backend(nginx2);

    new loadbalancera = directors.random();
    loadbalancera.add_backend(nginx,1.0);
    loadbalancera.add_backend(nginx2,1.0);

    new loadbalance = directors.round_robin();
    loadbalance.add_backend(loadbalancerr.backend());
    loadbalancer.add_backend(loadbalancera.backend());
}

sub vcl_recv {
    set req.backend_hint = loadbalance.backend();
    return(pass);
}
