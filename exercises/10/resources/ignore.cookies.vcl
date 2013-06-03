backend default {
  .host = "localhost";
  .port = "8080";
}
sub vcl_recv {
   return(lookup);
}
sub vcl_fetch {
   return(deliver);
}
sub vcl_deliver {
    set resp.http.x-cache-hits = obj.hits;
    if (obj.hits > 0) {
        set resp.http.x-cache = "hit";
    } else {
        set resp.http.x-cache = "miss";
    }
}