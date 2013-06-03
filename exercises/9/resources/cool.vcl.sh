#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise9cool $cwd/cool.vcl
varnishadm vcl.use exercise9cool
varnishadm vcl.list | grep active
