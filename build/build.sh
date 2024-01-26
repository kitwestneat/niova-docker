#!/bin/bash

export INSTALL_DIR=/niova/root

do_make() {
    [ "1" = "$CLEAN" ] && make clean
    make -j4
    make install
    make install DESTDIR=$INSTALL_DIR
}

# mkdir -p $INSTALL_DIR/usr/lib
# ln -s $INSTALL_DIR/usr/lib $INSTALL_DIR/usr/lib64

pushd niova-block

    pushd niova-core
    ./prepare.sh
    ./configure --prefix=/usr
    do_make
    popd

./prepare.sh
./configure --with-niova=/usr/niova/ CFLAGS="-O2 -ggdb $CFLAGS" --prefix=/usr
do_make
popd

pushd spdk
./configure --with-niova --prefix=/usr
do_make
popd

