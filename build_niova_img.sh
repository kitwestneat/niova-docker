#!/bin/bash

docker build build/docker/ -t niova-build
docker run -v $PWD/src/root/:/niova/root:Z  -v $PWD/build/:/niova/build:Z -it -e CLEAN=$CLEAN niova-build
docker build src -t niova
