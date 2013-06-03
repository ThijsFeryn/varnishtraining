#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise7fallbackdown $cwd/fallback.down.vcl
varnishadm vcl.use exercise7fallbackdown
varnishadm vcl.list | grep active
