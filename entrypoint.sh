#!/bin/bash -x

echo "Run the explorer"
python -m Mce.abe --config ${EXPLORER_CFG} --commit-bytes 100000 --no-serve && 
python -m Mce.abe --config ${EXPLORER_CFG}
