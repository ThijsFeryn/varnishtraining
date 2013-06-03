#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise5 $cwd/default.vcl
varnishadm vcl.use exercise5
varnishadm vcl.list | grep active
