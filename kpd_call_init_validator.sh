sudo ./scripts/init_validator.sh \
  --use-ramdisk-for-account True \
  --swap-file-size-gb 512 \
  --ledger-path /mnt/solana/ledger \
  --jito-enable True \
  --jito-block-engine-url https://ny.mainnet.block-engine.jito.wtf \
  --jito-relayer-url http://ny.mainnet.relayer.jito.wtf:8100 \
  --jito-receiver-addr 141.98.216.96:1002 \
  --jito-tip-payment-program-pubkey T1pyyaTNZsKv2WcRAB8oVnk93mLJw2XzjtVYqCsaHqt \
  --jito-distribution-program-pubkey 4R3gSG8BpU4t19KYj8CfnbtRpnT8gtk4dvTHxVRwc2r7 \
  --jito-merkle-root-upload-authority GZctHpWXmsZC1YHACTGGcHhYxjdRqQvTpYkb9LMvxDib \
  --jito-commission-bps 0
