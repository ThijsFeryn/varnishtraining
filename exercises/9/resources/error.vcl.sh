#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise9error $cwd/error.vcl
varnishadm vcl.use exercise9error
varnishadm vcl.list | grep active
