#!/bin/bash -x

num=$((RANDOM%2))
if [ $num -eq 0 ]
then
        echo "Heads"
else
        echo "Tails"
fi
