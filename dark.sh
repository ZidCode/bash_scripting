#!/bin/bash

for file in `ls dark* |sort -g -r`
do
    filename=$(basename "$file")
    echo $filename
    extension=${filename##*.}
    echo $extension
    filename=${filename%.*}
    echo $filename

done
