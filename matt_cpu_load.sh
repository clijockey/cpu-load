#!/bin/bash
trap finished INT

if [[ -z $1 ]]; then
    proc=8
else
    proc=$1
fi

finished() {
    kill $pid
    exit
}

for i in $(seq 0 $proc); do
    dd if=/dev/zero of=/dev/null >/dev/null 2>&1 &
    pid="$pid $!"
done
echo Started - press ctrl+c or enter to exit
echo PID list: $pid
read a
finished
