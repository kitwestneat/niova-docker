#!/usr/bin/bash

# unset vars are errors
set -u

export NIOVA_LOG_LEVEL=${NIOVA_LOG_LEVEL:-3}

/niova/niova-block/src/nisd -d /store/nisd.img -u $TGT_UUID
