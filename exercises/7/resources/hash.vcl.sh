#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise7hash $cwd/hash.vcl
varnishadm vcl.use exercise7hash
varnishadm vcl.list | grep active
