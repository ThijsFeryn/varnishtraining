#!/bin/bash
cwd=$(pwd)
varnishadm vcl.load exercise10session $cwd/session.vcl
varnishadm vcl.use exercise10session
varnishadm vcl.list | grep active
