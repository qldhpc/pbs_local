#!/bin/bash

if [ $# -ne 1 ]
then
  echo Usage: $0 node
  exit 1
fi

node=$1

#echo Marking node $node online

qmgr -c "unset node $node comment"
qmgr -c "unset node $node[0] comment"
qmgr -c "unset node $node[1] comment"
pbsnodes -r $node

echo "Remaining Time: "  `/pkg/hpc/scripts/pbsnodes_finish.sh $node |tail -n1`
