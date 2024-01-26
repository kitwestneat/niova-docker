#!/usr/bin/bash

# unset vars are errors
set -u
set -e

export NIOVA_LOG_LEVEL=${NIOVA_LOG_LEVEL:-3}

NISD_IMG=/store/nisd.img
init_device() {
    echo "initializing $NISD_IMG"
    BLKS=$(($DEV_SIZE / 4096))
    dd if=/dev/zero of=$NISD_IMG bs=4096 count=$BLKS
    niova-block-ctl -d $NISD_IMG -i -u $TGT_UUID
}

[ -f $NISD_IMG ] || init_device 

/usr/bin/nisd -d $NISD_IMG -u $TGT_UUID

