#!/bin/bash

docker run -it \
    -v niova-store:/store -p 4420:4420 \
    -e TGT_UUID=$(uuid) -e VDEV_UUID=$(uuid) -e DEV_SIZE=$((10*1024*1024)) \
    niova $*
