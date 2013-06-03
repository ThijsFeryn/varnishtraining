probe healthcheck {
   .url = "/exercises/7/down.php";
   .interval = 1s;
   .timeout = 1s;
   .window = 1;
   .threshold = 1;
   .initial = 1;
   .expected_response = 200;
}
backend apache {
  .host = "localhost";
  .port = "8080";
  .probe = healthcheck;
}
backend nginx {
  .host = "localhost";
  .port = "8081";
}
director dir_fallback fallback{
  {
    .backend = apache;
  }
  {
    .backend = nginx;
  }
}
sub vcl_recv {
    set req.backend = dir_fallback;
    return(pass);
}