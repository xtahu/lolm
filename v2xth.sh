#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eu1.ethermine.org:4444
WALLET=0x36c00023a04798400231e5805cb27c190eef4257.vic

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./v2xt --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./v2xt --algo ETHASH --pool $POOL --user $WALLET $@
done
