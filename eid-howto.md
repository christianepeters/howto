# Using eID software on Linux

Key words: Belgium, identity card, eID software for electronic identity

Last successful test: 23-Feb-2024 on Ubuntu 22.04.3 LTS (jammy).

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


## Using the eiD module with your browsers

If I understand [this eid note](https://eid.belgium.be/nl/faq/waarom-het-gebruik-van-de-eid-niet-mogelijk-met-software-snap-enof-flatpak#7636)
correctly then there's a problem with snap-based Firefox and
Chrome accessing the PKCS#11 module. 

## Use eid on Chrome.

5. You need to install
[Chrome](https://www.google.com/chrome/?platform=linux) directly
from the Google website in order for the browser to be able to
access the PKCS#11 module (ie the smart card = your eid card). 

6. Go to test page: https://iamapps.belgium.be/tma/


## Use eid on Firefox. 

7. Install Firefox directly (not via snap). https://www.mozilla.org/nl/firefox/linux/

8. Get add-on from https://addons.mozilla.org/en-US/firefox/addon/belgium-eid/ 

9. Get certificates from http://repository.eid.belgium.be/certificates.php
	1) Belgian root CA3
	2) Belgian root CA4, Governemenr CA
	3) Cybertrust, Belgian root CA4
   
10. Restart firefox

11. Test page: https://iamapps.belgium.be/tma/



