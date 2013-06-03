probe healthcheck {
   .url = "/exercises/11/index.php";
   .interval = 1s;
   .timeout = 1s;
   .window = 1;
   .threshold = 1;
   .initial = 1;
   .expected_response = 200;
}
backend default {
  .host = "localhost";
  .port = "8080";
  .probe = healthcheck;
}
sub vcl_recv{
    if (req.backend.healthy) {
        set req.grace = 0s;
    } else {
        set req.grace = 20s;
    }
}
sub vcl_fetch{
    set beresp.grace = 20s;
}