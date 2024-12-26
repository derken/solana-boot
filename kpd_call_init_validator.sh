#!/bin/bash

#LOC=slc
#SHRED_RECEIVER=64.130.53.8:1002

#LOC=ny
#SHRED_RECEIVER=141.98.216.96:1002

#LOC=frankfurt
#SHRED_RECEIVER=64.130.50.14:1002

LOC=amsterdam
SHRED_RECEIVER=74.118.140.240:1002


sudo ./scripts/init_validator.sh \
  --use-ramdisk-for-account True \
  --swap-file-size-gb 512 \
  --jito-enable True \
  --jito-block-engine-url https://$LOC.mainnet.block-engine.jito.wtf \
  --jito-relayer-url http://$LOC.mainnet.relayer.jito.wtf:8100 \
  --jito-receiver-addr $SHRED_RECEIVER 
