# Configure SSH for two github accounts

## Problem

Multiple accounts on github.

* https://home.github.com/username and
* https://company.github.com/username

I'd like to use ssh to access either account from the same
machine.


## Configure SSH connections

First create two ssh key pairs using ssh-keygen following standard
guidelines, e.g., https://www.ssh.com/ssh/keygen. It boils down
to

~~~~
ssh-keygen
~~~~

with default options. Ignore the passphrase unless you want to
type it in every time you access the github repo.

The result are four files in the `~/.ssh` folder:

~~~~
id_rsa-github-home		    # for github private account
id_rsa-github-home.pub
id_rsa-github-company		# for company github
id_rsa-github-company.pub
~~~~

### Public Keys
Import the public keys into the respective github accounts
https://home.github.com/settings/keys and
https://company.github.com/settings/keys

### Private Keys
In the terminal on your local machine, add the ssh keys to the
authentication agent. Just in case, delete old cached keys.

~~~~
$ ssh-add -D
~~~~

Check keys

~~~~
$ ssh-add -l
	The agent has no identities.
~~~~

Add keys

~~~~
$ ssh-add ~/.ssh/id_rsa-github-home
$ ssh-add ~/.ssh/id_rsa-github-company
~~~~

Add keys to ssh config file with host names for both enterprise
and private github.

~~~~
$ vi ~/.ssh/config 

	Host home.github.com
	  HostName home.github.com
	  PreferredAuthentications publickey
	  IdentityFile /Users/username/.ssh/id_rsa-github-home
	
	Host company.github.com
	  HostName company.github.com
	  PreferredAuthentications publickey
	  IdentityFile /Users/username/.ssh/id_rsa-github-company
~~~~

### Test connection
Test connections to respective github accounts:

~~~~
$ ssh -T git@home.github.com
	Hi username! You've successfully authenticated, but GitHub does not provide shell access.

$ ssh -T git@company.github.com
	Hi username! You've successfully authenticated, but GitHub does not provide shell access.
~~~~



## Create a test github repo

Create test repo to be hosted on private account https://home.github.com/username/test.git

~~~~
$ mkdir test
$ cd test/
$ git init
$ git config user.name “Firstname Lastname"
$ echo "This is a test" >> README.md
$ git add README.md 
$ git commit -m "initial commit"
$ git remote add origin git@home.github.com:username/test.git
$ git push -u origin master
$ git status
~~~~


Create test repo to be hosted on Acme Github enterprise account
https://company.github.com/username/test.git

~~~~
$ mkdir test
$ cd test/
$ git init
$ git config user.name “Firstname Lastname"
$ git config --global user.email “username@acme.com"
$ echo "This is a test" >> README.md
$ git add README.md 
$ git commit -m "initial commit"
$ git remote add origin git@company.github.com:username/test.git
$ git push -u origin master
$ git status
~~~~

Works :-)


## Thanks to
https://coderwall.com/p/7smjkq/multiple-ssh-keys-for-different-accounts-on-github-or-gitlab
