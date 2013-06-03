#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise3 $cwd/default.vcl
varnishadm vcl.use exercise3
varnishadm vcl.list | grep active
