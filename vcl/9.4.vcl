vcl 4.0;

import std;

backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

sub vcl_recv {
    return(synth(200,"Cool"));
}

sub vcl_synth {
    synthetic(std.fileread("/vagrant/exercises/9/synth-before.html"));
    synthetic(resp.reason);
    synthetic(std.fileread("/vagrant/exercises/9/synth-after.html"));
    return(deliver);
}