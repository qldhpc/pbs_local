#!/bin/bash

echo -n $1 "	"
/pkg/hpc/scripts/pbsnodes_finish.sh $1 |tail -1
