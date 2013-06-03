#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise8 $cwd/default.vcl
varnishadm vcl.use exercise8
varnishadm vcl.list | grep active
