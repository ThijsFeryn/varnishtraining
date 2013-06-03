#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise10langcookie $cwd/lang.cookie.vcl
varnishadm vcl.use exercise10langcookie
varnishadm vcl.list | grep active
