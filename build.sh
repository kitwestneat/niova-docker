#!/bin/bash


pushd niova-block

    pushd niova-core
    ./prepare.sh
    ./configure
    make
    make install
    popd

./prepare.sh
./configure --with-niova=/usr/local/niova/ CFLAGS="-O0 -ggdb" --enable-asan
make
make install
popd

pushd spdk
./configure --with-niova
make
popd

