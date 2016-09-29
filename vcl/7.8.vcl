vcl 4.0;

import directors;

probe healthcheck {
   .url = "/exercises/7/down.php";
   .interval = 5s;
   .timeout = 1s;
   .window = 10;
   .threshold = 3;
   .initial = 1;
   .expected_response = 200;
}

backend nginx {
  .host = "127.0.0.1";
  .port = "8081";
  .probe = healthcheck;
}

backend nginx2 {
  .host = "127.0.0.1";
  .port = "8082";
  .probe = healthcheck;  
}

sub vcl_init {
    new loadbalance = directors.fallback();
    loadbalance.add_backend(nginx);
    loadbalance.add_backend(nginx2);
}

sub vcl_recv {
    set req.backend_hint = loadbalance.backend();
    return(pass);
}
