#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise10cachecookies $cwd/cache.cookies.vcl
varnishadm vcl.use exercise10cachecookies
varnishadm vcl.list | grep active
