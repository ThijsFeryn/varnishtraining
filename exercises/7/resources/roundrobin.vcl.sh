#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise7roundrobin $cwd/roundrobin.vcl
varnishadm vcl.use exercise7roundrobin
varnishadm vcl.list | grep active
