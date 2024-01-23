#!/bin/bash
#
git submodule update --init --recursive

pushd niova-block
git submodule update --init --recursive

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

