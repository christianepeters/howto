# Free up space in Ubuntu

I used the following steps from https://itsfoss.com/free-up-space-ubuntu-linux/
to make space in my root partition `/`.

1. Remove applications I don't need any more.

2. Clean up package manager related stuff

	```
	sudo apt autoremove
	sudo apt autoclean
	```

3. Remove old kernels
	```
	uname -r
	dpkg --list 'linux-image*' | grep ii
	sudo apt remove --purge linux-image-KERNELVERSION
	sudo apt autoremove
	```

4. Remove logs older than 3 days:
	```
	journalctl --disk-usage
	sudo journalctl --vacuum-time=3d
	```

5. Remove old snaps
	```
	du -h /var/lib/snapd/snaps
	```
	using this script
	```
	#!/bin/bash
	# Removes old revisions of snaps
	# CLOSE ALL SNAPS BEFORE RUNNING THIS
	set -eu
	snap list --all | awk '/disabled/{print $1, $3}' |
	    while read snapname revision; do
	        snap remove "$snapname" --revision="$revision"
	    done
	```

6. Check space:
	```
	df -h
	```

Tested successfully on 30-Jul-2025.
