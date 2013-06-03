backend default {
  .host = "localhost";
  .port = "8080";
}
sub vcl_fetch {
	set beresp.ttl = 3s;
}