backend apache {
  .host = "localhost";
  .port = "8080";
}
backend nginx {
  .host = "localhost";
  .port = "8081";
}
director dir_client client{
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
    set req.backend = dir_client;
    set client.identity = regsuball(req.url,"^(.+)\?a=(.+)$","\2");
    return(pass);
}