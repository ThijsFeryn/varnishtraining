#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise10 $cwd/default.vcl
varnishadm vcl.use exercise10
varnishadm vcl.list | grep active
