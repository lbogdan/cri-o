#!/bin/sh

[ -f ./crio ] && rm -fv crio
DOCKER_BUILDKIT=1 docker build -o type=local,dest=. .
