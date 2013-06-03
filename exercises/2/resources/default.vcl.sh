#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise2 $cwd/default.vcl
varnishadm vcl.use exercise2
varnishadm vcl.list | grep active
