#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise9ok $cwd/ok.vcl
varnishadm vcl.use exercise9ok
varnishadm vcl.list | grep active
