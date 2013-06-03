#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise7client $cwd/client.vcl
varnishadm vcl.use exercise7client
varnishadm vcl.list | grep active
