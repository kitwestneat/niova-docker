#!/usr/bin/bash

# unset vars are errors
set -u

IO_UNIT_SIZE=${IO_UNIT_SIZE:-16384}
MAX_QPAIRS=${MAX_QPAIRS:-8}
CAP_DATA_SIZE=${CAP_DATA_SIZE:-8192}

CLIENT_SPDK_MEMORY_KB=1024
IP_ADDR=$(hostname -i)

export NIOVA_LOG_LEVEL=${NIOVA_LOG_LEVEL:-3}

/usr/bin/nvmf_tgt --no-huge --iova-mode=va -s $CLIENT_SPDK_MEMORY_KB &
sleep 10

RPC=/usr/bin/spdk_rpc
$RPC nvmf_create_transport -t TCP -u $IO_UNIT_SIZE -m $MAX_QPAIRS -c $CAP_DATA_SIZE

$RPC bdev_niova_create n1 $TGT_UUID $VDEV_UUID $DEV_SIZE

$RPC nvmf_create_subsystem nqn.2016-06.io.spdk:cnode1 -a -s SPDK00000000000001 -d SPDK_Controller1
$RPC nvmf_subsystem_add_ns nqn.2016-06.io.spdk:cnode1 n1
$RPC nvmf_subsystem_add_listener nqn.2016-06.io.spdk:cnode1 -t tcp -s 4420 -a $IP_ADDR

fg
