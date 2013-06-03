backend default {
  .host = "localhost";
  .port = "8080";
}
sub vcl_recv {
    if((req.request == "GET" || req.request == "HEAD")
        && req.http.Cookie ~ "PHPSESSID"
        && req.url !~ "\?logout=true"
    ){
       return(lookup);
    } elseif(req.url ~ "\?logout=true") {
        ban("obj.http.x-host == " + req.http.host
        + " &&  obj.http.x-session == " + regsuball(req.http.Cookie, "^.*;? ?PHPSESSID=([a-z0-9]+)( ?|;| ;).*$","\1"));
        return(pass);
    } else {
        ban("obj.http.x-url == " + req.url
        + " && obj.http.x-host == " + req.http.host
        + " &&  obj.http.x-session == " + regsuball(req.http.Cookie, "^.*;? ?PHPSESSID=([a-z0-9]+)( ?|;| ;).*$","\1"));
        return(pass);
    }
}
sub vcl_hash {
    if(req.http.Cookie ~ "PHPSESSID"){
        hash_data(regsuball(req.http.Cookie, "^.*;? ?PHPSESSID=([a-z0-9]+)( ?|;| ;).*$","\1"));
    }
}
sub vcl_fetch {
        set beresp.http.x-session = regsuball(req.http.Cookie, "^.*;? ?PHPSESSID=([a-z0-9]+)( ?|;| ;).*$","\1");
        set beresp.http.x-url = req.url;
        set beresp.http.x-host = req.http.host;
}
sub vcl_deliver {
    unset resp.http.x-session;
    unset resp.http.x-url;
    unset resp.http.x-host;
    set resp.http.x-cache-hits = obj.hits;
    if (obj.hits > 0) {
        set resp.http.x-cache = "hit";
    } else {
        set resp.http.x-cache = "miss";
    }
}