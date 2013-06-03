#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise10sanitize $cwd/sanitize.vcl
varnishadm vcl.use exercise10sanitize
varnishadm vcl.list | grep active
