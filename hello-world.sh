#!/bin/bash

# echo hello world in an infinite loop ever second while counting seconds
# and printing the current time
i=0
while true; do
    echo "Hello World! $i"
    i=$((i+1))
    sleep 1
done

