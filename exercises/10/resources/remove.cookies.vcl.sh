#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise10removecookies $cwd/remove.cookies.vcl
varnishadm vcl.use exercise10removecookies
varnishadm vcl.list | grep active
