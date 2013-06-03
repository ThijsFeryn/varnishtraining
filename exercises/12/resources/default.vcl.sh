#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise12 $cwd/default.vcl
varnishadm vcl.use exercise12
varnishadm vcl.list | grep active
