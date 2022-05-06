#/bin/sh

docker run --rm -it -v $PWD:/build -w /build golang:1.18.1-bullseye
