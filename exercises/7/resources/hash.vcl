backend apache {
  .host = "localhost";
  .port = "8080";
}
backend nginx {
  .host = "localhost";
  .port = "8081";
}
director dir_hash hash{
  {
    .backend = apache;
    .weight = 1;
  }
  {
    .backend = nginx;
    .weight = 1;
  }
}
sub vcl_recv {
    set req.backend = dir_hash;
    return(pass);
}