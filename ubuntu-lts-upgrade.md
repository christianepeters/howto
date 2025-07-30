# LTS Release Upgrade: Ubuntu 22.04 to Ubuntu 24.04

Time to upgrade my Ubuntu machine.
[Ubuntu 24.04](https://www.releases.ubuntu.com/24.04/) was
released more than a year ago, but somehow time flies.

No need to worry. LTS releases are supported for a long time,
with their expanded security updates going even into the next decade in
the case of 24.04.
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

5. Troubleshoot: if on step 3 you encounter an error that there's
not enough disk space
	```
	Not enough free disk space
	
	The upgrade has aborted. The upgrade needs a total of 4,729 M free
	space on disk '/'. Please free at least an additional 273 M of disk
	space on '/'. Empty your trash and remove temporary packages of
	former installations using 'sudo apt-get clean'.
	```
	then use [these steps](./ubuntu-free-up-space.md) to free up space.

6. After the upgrade I ran `apt update` and got some funny Chrome
issues which I fixed by removing all chrome repos from
`/etc/apt/sources.list.d`:
	```
	sudo rm google-chrome.*
	```
	then reinstalled Chrome and all errors vanished.
	```
	cd ~/Downloads
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	sudo apt-get install -f
	```

7. For other funny quirks, e.g., removing the Terminal Bell which keeps
coming back with every release upgrade, see
[my configuration of Ubuntu](./ubuntu-config.md).

Tested successfully on 30-Jul-2025.
