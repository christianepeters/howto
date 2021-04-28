#!/bin/bash
# Script to move a repo from bitbucket to github
# Usage: bb2gh.sh [reponame]
BBUSER=cbcrypto
GHUSER=christianepeters
PROJECT=${1}
git clone git@bitbucket.org:$BBUSER/$PROJECT.git $PROJECT
cd $PROJECT
git remote rename origin bitbucket
git remote add origin git@github.com:$GHUSER/$PROJECT.git
git push origin master
git remote rm bitbucket
