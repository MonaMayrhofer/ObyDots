#!/bin/bash

wdir=$(dirname $(readlink -f $0))
echo "Working in $wdir"

cd $wdir
git pull
git submodule update --recursive --remote
