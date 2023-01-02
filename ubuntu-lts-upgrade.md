# LTS Release Upgrade: Ubuntu 20.04 to Ubuntu 22.04

It's a new year and time to upgrade my Ubuntu machine.
[Ubuntu 22.04](https://www.releases.ubuntu.com/22.04/) was
released almost a year ago, but somehow time flies.

No need to worry. LTS releases are supported for a long time,
with their security updates going even into the next decade in
the case of 20.04.
For more info see here https://ubuntu.com/about/release-cycle

Before you start, ensure the machine is **backed up**.
Whatever works for you, but don't go further without a **backup**.

1. Preparation
	```
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get dist-upgrade -y
	sudo apt-get autoremove -y
	```
2. Check package to upgrade from one release to another
	```
	sudo apt install update-manager-core
	```
3. Time to start the upgrade
	```
	sudo do-release-upgrade -d
	```
4. Restart, then confirm upgrade to Release 22.04:
	```
	lsb_release -a
	```

Tested successfully on 2-Jan-2023.
