#!/bin/bash
set -e

source ~/.bashark/bashark.sh

I=0
COUNT=3

echo "${UNDERLINE}Running some tasks${END_UNDERLINE}"
echo ""

while [ $I -lt $COUNT ]; do
    I=$(($I+1))
    cmd "Running task $I/$COUNT" sleep 1
done 

function failure() {
    echo "I have failed you master!" > /dev/stderr
    exit 123
}
echo ""

echo "${UNDERLINE}Running a command that fails${END_UNDERLINE}"
echo ""

cmd "Task" failure