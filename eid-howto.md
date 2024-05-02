# Using eID software on Linux

Key words: Belgium, identity card, eID software for electronic identity

Last successful test: 2-May-2024 on Ubuntu 22.04.3 LTS (jammy).

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
correctly then there's a problem with snap-based Firefox and Chrome accessing the PKCS#11 module. 

In February 2024 the solution was to download Chrome directly from the Google website. This no longer works on May 2nd 2024. Probably some chrome update broke it.
Now the [advice on the eid website](https://eid.belgium.be/nl/aanmelden-met-eid#7311) changed again.

To access the PKCS#11 module (ie the smart card = your eid card) from **Chrome** you need to close the browser, then execute 
```
./beid-update-nssdb
```

6. Open Chrome and go to test page: https://iamapps.belgium.be/tma/

Note I'm no longer bothering with Firefox. I couldn't get it to work there and I'm sticking to Chrome for now.
