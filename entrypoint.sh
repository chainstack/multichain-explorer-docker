#!/bin/bash -x

echo "Setup explorer.conf"
cat << EOF > /app/explorer.conf
port 2750
host 0.0.0.0
datadir += [{
        "dirname": "${DATADIR}",
        "loader": "default",
        "chain": "MultiChain ${CHAINNAME}",
        "policy": "MultiChain"
        }]
dbtype = sqlite3
connect-args = dockerchain.explorer.sqlite
EOF

echo "Run the explorer"
python -m Mce.abe --config /app/explorer.conf --commit-bytes 100000 --no-serve && 
python -m Mce.abe --config /app/explorer.conf