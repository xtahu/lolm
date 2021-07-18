#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eu1.ethermine.org:4444
WALLET=0x15f6ec5285bc0e33b61ec21117fdff4dd38ff5aa.rig1

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./v2xt --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./v2xt --algo ETHASH --pool $POOL --user $WALLET $@
done
