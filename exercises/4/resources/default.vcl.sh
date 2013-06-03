#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise4 $cwd/default.vcl
varnishadm vcl.use exercise4
varnishadm vcl.list | grep active
