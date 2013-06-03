#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise10ignorecookies $cwd/ignore.cookies.vcl
varnishadm vcl.use exercise10ignorecookies
varnishadm vcl.list | grep active
