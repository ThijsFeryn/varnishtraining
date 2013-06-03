#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise7random $cwd/random.vcl
varnishadm vcl.use exercise7random
varnishadm vcl.list | grep active
