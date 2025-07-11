# Using eID software on Linux

Key words: Belgium, identity card, eID software for electronic identity

Last successful test: Jul 7, 2025 on Ubuntu 22.04.3 LTS (jammy).

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


## Using the eiD module with Chrome

The advice keeps changing. For the latest check [advice on the
eid website](https://eid.belgium.be/nl/aanmelden-met-eid#7311).

To access the PKCS#11 module (ie the smart card = your eid card) from **Chrome** you need to close the browser, then execute 
```
cd
modutil -dbdir sql:.pki/nssdb -add "Belgium eID" -libfile /usr/lib/libbeidpkcs11.so
```

Then Open Chrome and go to test page: https://iamapps.belgium.be/tma/



## Using the eiD module with Firefox

I'm no longer bothering with using the eid module in Firefox. I couldn't get it to work there and I'm sticking to Chrome for now.

If I understand [this eid note](https://eid.belgium.be/nl/faq/waarom-het-gebruik-van-de-eid-niet-mogelijk-met-software-snap-enof-flatpak#7636)
correctly then there's a problem with snap-based Firefox and Chrome accessing the PKCS#11 module. 

