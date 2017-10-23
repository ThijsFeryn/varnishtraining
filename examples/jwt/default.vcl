vcl 4.0;

import std;
import var;
import cookie;
import digest;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    if (req.http.Cookie) {
        cookie.parse(req.http.cookie);
        cookie.filter_except("jwt_cookie");
        set req.http.cookie = cookie.get_string();
        if (req.http.Cookie ~ "^\s*$") {
            unset req.http.Cookie;
        }
    }
    if ((req.method != "GET" && req.method != "HEAD") || req.http.Authorization) {
        return (pass);
    }
    call jwt;
    return(hash);
}

sub jwt {
  var.set("key",std.fileread("/etc/varnish/jwt.key"));
  std.log("Ready to perform some JWT magic");
  if(cookie.isset("jwt_cookie")) {

    #Extract header data from JWT
    var.set("token", cookie.get("jwt_cookie"));
    var.set("header", regsub(var.get("token"),"([^\.]+)\.[^\.]+\.[^\.]+","\1"));
    var.set("type", regsub(digest.base64url_decode(var.get("header")),{"^.*?"typ"\s*:\s*"(\w+)".*?$"},"\1"));
    var.set("algorithm", regsub(digest.base64url_decode(var.get("header")),{"^.*?"alg"\s*:\s*"(\w+)".*?$"},"\1"));

    #Don't allow invalid JWT header
    if(var.get("type") == "JWT" && var.get("algorithm") == "HS256") {

      #Extract signature & payload data from JWT
      var.set("rawPayload",regsub(var.get("token"),"[^\.]+\.([^\.]+)\.[^\.]+$","\1"));
      var.set("signature",regsub(var.get("token"),"^[^\.]+\.[^\.]+\.([^\.]+)$","\1"));
      var.set("currentSignature",digest.base64url_nopad_hex(digest.hmac_sha256(var.get("key"),var.get("header") + "." + var.get("rawPayload"))));
      var.set("payload", digest.base64url_decode(var.get("rawPayload")));
      var.set("exp",regsub(var.get("payload"),{"^.*?"exp"\s*:\s*([0-9]+).*?$"},"\1"));
      var.set("userId",regsub(var.get("payload"),{"^.*?"uid"\s*:\s*([0-9]+).*?$"},"\1"));

      #Only allow valid userId
      if(var.get("userId") ~ "^\d+$") {
        #Don't allow expired JWT
        if(std.time(var.get("exp"),now) >= now) {
            #Don't allow invalid JWT signature
            if(var.get("signature") == var.get("currentSignature")) {
                #The sweet spot
                set req.http.X-Login="true";
            } else {
                std.log("JWT: signature doesn't match. Received: " + var.get("signature") + ", expected: " + var.get("currentSignature"));
                std.log("JWT: Key: " + var.get("key"));
                std.log("JWT: Header: " + var.get("header"));
                std.log("JWT: Payload: " + var.get("rawPayload"));
            }
        } else {
            std.log("JWT: token has expired");
        }
      } else {
        std.log("UserId '"+ var.get("userId") +"', is not numeric");
      }
    } else {
      std.log("JWT: type is not JWT or algorithm is not HS256");
    }
    std.log("JWT processing finished. UserId: " + var.get("userId") + ". X-Login: " + req.http.X-login);
  }
  if(req.url ~ "^/(\?[^\?]+)?$" && req.http.X-Login != "true") {
    return(synth(302,"/post.php"));
  }
}

sub vcl_synth {
  #301 & 302 synths should be actual redirects
  if (resp.status == 301 || resp.status == 302) {
      set resp.http.location = resp.reason;
      set resp.reason = "Moved";
      return (deliver);
  }
}
