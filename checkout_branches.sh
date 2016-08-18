#!/bin/bash -e

master_head=$(git log origin/master --oneline | head -n 1 | cut -d " " -f 1)

COMMITS=$(git log --oneline | cut -d ' ' -f 1 | awk -v patt=$master_head '{print $0};NR==patt {print} $0 ~ patt {exit}' | tac)
echo checking COMMITS $COMMITS

for COMMIT in $COMMITS
do
    echo checking
    echo $COMMIT
    git checkout $COMMIT
    py.test
    if [ $? -eq 0 ]
    then
        echo $COMMIT - passed
    else
        echo $COMMIT - failed
        exit
    fi

done
