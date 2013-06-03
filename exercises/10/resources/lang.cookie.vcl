backend default {
  .host = "localhost";
  .port = "8080";
}
sub vcl_recv {
    if(req.request == "GET" || req.request == "HEAD"){
       return(lookup);
    } else {
        return(pass);
    }
}
sub vcl_hash {
    if(req.http.Cookie ~ "lang"){
        hash_data(regsuball(req.http.Cookie, "^.*;? ?lang=([a-zA-Z0-9]+)( ?|;| ;).*$","\1"));
    }
}
sub vcl_deliver {
    set resp.http.x-cache-hits = obj.hits;
    if (obj.hits > 0) {
        set resp.http.x-cache = "hit";
    } else {
        set resp.http.x-cache = "miss";
    }
}