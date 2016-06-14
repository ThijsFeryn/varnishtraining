vcl 4.0;
backend default {
  .host = "127.0.0.1";
  .port = "8080";
}
sub vcl_recv {
   return(hash);
}
sub vcl_hash {
   hash_data(req.http.cookie);
}
sub vcl_deliver {
    set resp.http.x-cache-hits = obj.hits;
    if (obj.hits > 0) {
        set resp.http.x-cache = "hit";
    } else {
        set resp.http.x-cache = "miss";
    }
}