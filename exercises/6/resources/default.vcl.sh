#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise6 $cwd/default.vcl
varnishadm vcl.use exercise6
varnishadm vcl.list | grep active
