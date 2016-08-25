#!/bin/bash


#git for-each-ref refs/heads | cut -d/ -f3
#$(git branch | cut -c 3-)
branches=()
current_branch=$( git branch | cut -c 3-| head -n 1 )
for branch in $(git branch | cut -c 3-); do
    echo CHECKING OUT $branch
    git checkout $branch
    git rebase origin/master
done
git checkout $current_branch
#git for-each-ref refs/heads | cut -d/ -f3-
#git for-each-ref refs/heads --format='%(refname)'
