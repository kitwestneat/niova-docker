#!/bin/bash -e

/niova/run_server.sh &
/niova/run_client.sh &
wait
