#!/usr/bin/env bash

rm -rf ~/.band

bandd init node --chain-id check

cp /config/genesis.json ~/.band/config/genesis.json

if test -f /config/priv_validator_key.json; then
    cp /config/priv_validator_key.json ~/.band/config/priv_validator_key.json
fi

if test -f /config/node_key.json; then
    cp /config/node_key.json ~/.band/config/node_key.json
fi

sed -i 's/enable = false/enable = true/' ~/.band/config/app.toml

# uncomment to disable cors
#sed -i 's/enabled-unsafe-cors = false/enabled-unsafe-cors = true/' ~/.band/config/app.toml
#sed -i 's/cors_allowed_origins = \[\]/cors_allowed_origins = ["*"]/' ~/.band/config/config.toml