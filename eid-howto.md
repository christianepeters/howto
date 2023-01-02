# Using eID software on Linux

Key words: Belgium, identity card, eID software for electronic identity

Last successful test: 5-July-2022 on Ubuntu 20.04.

## Download and basic install
 
1. Download and install the eID software `eid-archive*.deb` from
	https://eid.belgium.be/en/linux-eid-software-installation

2. Run deb file to point apt-get to the right repositories

``` 
    sudo gdebi eid-archive_*.deb 
    sudo apt-get update
``` 

3. Install `eid-viewer` and `eid-mw`.
``` 
    sudo apt-get install eid-viewer eid-mw
``` 

4. Test if eiD viewer works. Plug in card reader, then open
``` 
    eid-viewer # can also be found under Applications/Accessories
``` 
   which should show the info stored on the card.

## Get it to work in Firefox. 

5. Get add-on from https://addons.mozilla.org/en-US/firefox/addon/belgium-eid/ 

6. Get certificates from http://repository.eid.belgium.be/certificates.php
	1) Belgian root CA3
	2) Belgian root CA4, Governemenr CA
	3) Cybertrust, Belgian root CA4
   
7. Restart firefox

8. Test page: https://iamapps.belgium.be/tma/
