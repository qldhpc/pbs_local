#!/bin/bash

if [ $# -ne 2 ]
then
  echo Usage: $0 node comment
  exit 1
fi

node=$1
comment=$2

#echo Marking node $node offline with comment: $comment

pbsnodes -o $node
qmgr -c "s n $node comment=\"$comment\""

echo "Remaining Time: "  `/pkg/hpc/scripts/pbsnodes_finish.sh $node |tail -n1`
