#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise10static $cwd/static.vcl
varnishadm vcl.use exercise10static
varnishadm vcl.list | grep active
