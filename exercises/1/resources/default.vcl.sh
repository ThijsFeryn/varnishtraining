#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise1 $cwd/default.vcl
varnishadm vcl.use exercise1
varnishadm vcl.list | grep active
