# Ubuntu 20.04 Initial Configurations

After [setting up Ubuntu alongside Windows](dual-boot.md), here's what I do to make Ubuntu the way I like it:


## Switch ctrl and Fn keys in BIOS
* F2 gets you into the BIOS

## Aspire 5 touchpad not recognized
* no idea what I did
* I went into the Windows partition, downloaded I/O driver from Acer website
* got errors during install of the I/O driver, but after some reboots, touchpad was back in Windows and also in Ubuntu

## Default editor
* Change to `vim`:
```
su
apt-get update
apt-get install vim
update-alternatives --config editor
```

## Terminal bell
* Go into terminal preferences and disable terminal bell in profiles

## gdebi
* Install
```
sudo apt-get install aptitude gdebi
```

## Chrome
* Download .deb from google.com/chrome
```
sudo gdebi google-chrome-stable_current_amd64.deb
cd /usr/bin
sudo ln -sf google-chrome chrome
```

## /scratch partition
* Change permissions on /scratch partition
```
su
chown christiane:christiane /scratch
```

## Change Desktop background
* Go to Settings and change the picture

## Keyboard shortcuts 
* Go to Settings -> Keyboard -> Shortcuts
* add xkill
* add maximize vertically (alt+w)
* 'new terminal' shortcut change to super+n,
* Application vs Window switcher
	* Switch Applications Alt-Tab groups windows
	* Switch windows of an application Alt+`

## Copy files from USB drive: 
* home 
* pictures, movies, music, literature, downloads to scratch

## Browser
* move old .mozilla preference folder to new installation

## Enable backspace in firefox
* about:config look for "backspace action" or so and set to 0 

## git
* Install
``` 
sudo apt install git
``` 

## mutt
* Install
``` 
sudo apt install mutt mutt-vc-query rolo
``` 

## ssh 
* Change permissions on private keys:
``` 
chmod 600 id_rsa
``` 

## Permissions on .gnupg
 * Set ownership to your own user and primary group
``` 
chown -R "$USER:$(id -gn)" ~/.gnupg
``` 
* Set permissions to read, write, execute for only yourself, no others
``` 
chmod 700 ~/.gnupg
``` 
* Set permissions to read, write for only yourself, no others
``` 
chmod 600 ~/.gnupg/*
``` 

## Clock
* Show seconds and date in status bar:
``` 
gsettings set org.gnome.desktop.interface clock-show-seconds true
``` 

## Disable overlay scrollbars
* Add the following lines to the `.profile` file:
``` 
vi ~/.profile # add the following two lines; then logout/login
export GTK_OVERLAY_SCROLLING=0
gdbus call --session --dest org.freedesktop.DBus --object-path /org/freedesktop/DBus --method org.freedesktop.DBus.UpdateActivationEnvironment '{"GTK_OVERLAY_SCROLLING": "0"}'
``` 

## CTRL ALT BACKSPACE
* Enable x server kill (ctrl alt backspace) 
``` 
sudo dpkg-reconfigure keyboard-configuration
``` 

## Bash completion
* Enable completion of apt-get / aptitude install
``` 
sudo apt-get install bash-completion
``` 

## Tor
* Download Tor bundle from https://www.torproject.org/

## Dropbox
* Add to apt sources
``` 
sudo vi /etc/apt/sources.list.d/dropbox.list
``` 
* Add the following line to this file.
``` 
deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu bionic main
``` 
* save and close
* add apt-key
``` 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
``` 
* install dropbox ubuntu 20.04 LTS
``` 
sudo apt update
sudo apt install python3-gpg dropbox
``` 
* create mountpoint in ~/
``` 
mkdir ~/dropbox
``` 

## encfs (encryption)
* Install
``` 
sudo apt-get install encfs
``` 
* mount encrypted volumes
``` 
encfs /scratch/Dropbox/encrypted /home/christiane/dropbox
``` 
* unmount
``` 
fusermount -u /home/christiane/dropbox
``` 

## canberra-gtk module missing
* Install
``` 
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module
``` 

## markdown viewer
* install "Markview Preview Plus" extension in Chrome and allow
* local access to URLs in the extension settings

## truecrypt
* Copy files, check signature, untar:
``` 
truecrypt-7.1a-linux-x64.tar.gz
truecrypt-7.1a-linux-x64.tar.gz.sig
``` 
* Run:
``` 
./truecrypt-7.1a-setup-x64
``` 

## print to pdf
* Install
``` 
sudo aptitude install printer-driver-cups-pdf
``` 

## iphone pictures
* .heif to JPG conversion
``` 
sudo apt-get update
sudo apt-get install libheif-examples
``` 
* Convert using
``` 
for file in *.heic; do heif-convert $file ${file/%.heic/.jpg}; done
``` 

## eid viewer
* See my [eid-howto.md](eid-howto.md).

## helib
* See [my tutorial here](https://github.com/christianepeters/homomorphic-encryption/blob/main/helib.md)
* Install pre-requisites
``` 
sudo apt-get install g++ cmake patchelf m4 libgmp-dev libntl-dev
``` 

## Docker
* Install
``` 
sudo apt-get install docker docker.io
``` 

## Other programs
* Install
``` 
sudo apt-get install aspell aspell-de aspell-en aspell-fr aspell-nl audacious baobab bash-completion bzip2 calibre cheese curl elinks ffmpeg ftp gedit gparted lame meld openssl pandoc pari-gp subversion texlive-base unison vlc
``` 
