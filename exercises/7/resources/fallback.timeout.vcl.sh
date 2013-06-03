#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise7fallbacktimeout $cwd/fallback.timeout.vcl
varnishadm vcl.use exercise7fallbacktimeout
varnishadm vcl.list | grep active
