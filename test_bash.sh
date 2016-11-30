#!/bin/bash

#grep DELETE * | awk -F : '{print $1}' | xargs rm -f

if [ ! -d nadir ]; then
    mkdir -p nadir;
fi

while read time old new;
do
    if [ -z "$new" ]; then
        echo "skipping"
    else
        mv $old $new
    fi
done <timeline_wo
