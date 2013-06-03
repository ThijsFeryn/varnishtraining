backend apache {
  .host = "localhost";
  .port = "8080";
}
backend nginx {
  .host = "localhost";
  .port = "8081";
}
director dir_round round-robin {
  {
    .backend = apache;
  }
  {
    .backend = nginx;
  }
}
sub vcl_recv {
    set req.backend = dir_round;
    return(pass);
}