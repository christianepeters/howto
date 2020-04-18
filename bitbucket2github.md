# Move repositories including history from bitbucket to github

I decided to copy my repositories from
[Bitbucket](https://bitbucket.org/) to
[GitHub](https://github.com/).
Thanks a lot to bitbucket for the great service all those years.

## Move

I am accessing both bitbucket and github using ssh.

1. First I created the empty repository on using the GitHub web
   interface.
   I kept 'Initialize this repository with a README' unchecked.

2. On my local machine, I cloned the bitbucket repository, then
   pointed the origin to github.

To make it easy I wrote a script [bb2gh.sh](scripts/bb2gh.sh).
Simply call the script with the repository name. 
I had only a handful of repositories to move so
I didn't further automate it.

~~~~
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
~~~~

That's it.

