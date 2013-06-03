backend apache {
  .host = "localhost";
  .port = "8080";
}
backend nginx {
  .host = "localhost";
  .port = "8081";
}
director dir_rand random {
  .retries = 5;
  {
    .backend = apache;
    .weight  = 1;
  }
  {
    .backend = nginx;
    .weight  = 5;
  }
}
sub vcl_recv {
    set req.backend = dir_rand;
    return(pass);
}