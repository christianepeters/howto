# Ubuntu 26.04 Initial Configurations

## Updates

```
sudo apt update
sudo apt upgrade
```


## Default editor
Change to `vim`:
```
sudo apt update
sudo apt install vim
sudo update-alternatives --config editor
```

## Terminal bell
* Go into terminal preferences and disable terminal bell in profiles


## Chrome

Download .deb from google.com/chrome

```
sudo dkpg -i google-chrome-stable_current_amd64.deb
cd /usr/bin
sudo ln -sf google-chrome chrome
```

In case there are some issues with dependencies use
```
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f
```

## Change Desktop background
* Go to Settings and change the picture

## Disable overlay scrollbars

Add the following lines to the `.profile` file:

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
Not sure that worked on Ubuntu 26.04. TBC.


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

## Browser
* move old .mozilla preference folder to new installation

## Enable backspace in firefox
* about:config look for "backspace action" or so and set to 0 

## git
``` 
sudo apt install git
``` 

## ssh 
Change permissions on private keys:
``` 
chmod 600 id_rsa
``` 

## Permissions on .gnupg
Set ownership to your own user and primary group
``` 
chown -R "$USER:$(id -gn)" ~/.gnupg
``` 

Set permissions to read, write, execute for only yourself, no others
``` 
chmod 700 ~/.gnupg
``` 

Set permissions to read, write for only yourself, no others
``` 
chmod 600 ~/.gnupg/*
``` 

## Clock
Show seconds and date in status bar:

``` 
gsettings set org.gnome.desktop.interface clock-show-seconds true
``` 


## Tor

Download Tor bundle from https://www.torproject.org/
```
tar -xf tor-browser-linux-x86_64-*.tar.xz 
```

## Markdown viewer
* Install "Markview Preview Plus" extension in Chrome
([Chrome web store link](https://chromewebstore.google.com/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl))
* Allow local access to URLs in the extension settings

## print to pdf
``` 
sudo apt install printer-driver-cups-pdf
``` 

## iphone pictures
* .heif to JPG conversion
``` 
sudo apt update
sudo apt install libheif-examples
``` 

Convert using
``` 
for file in *.heic; do heif-convert $file ${file/%.heic/.jpg}; done
``` 

## eid viewer
* See my [eid-howto.md](eid-howto.md).


## Docker
``` 
sudo apt install docker docker.io
``` 


## Other programs
``` 
sudo apt install aspell aspell-de aspell-en aspell-fr aspell-nl audacious audacity baobab bash-completion bzip2 calibre curl elinks ffmpeg ftp gedit gparted lame libreoffice mplayer meld mplayer openssl pandoc pari-gp pavucontrol subversion texlive-base unison vlc
``` 

## Dropbox

Download from https://www.dropbox.com/install-linux

``` 
sudo dpkg -i dropbox-*.deb
``` 

* create mountpoint in ~/
	``` 
	mkdir ~/dropbox
	``` 

## encfs (encryption)
``` 
sudo apt-get install encfs
``` 

mount encrypted volumes
``` 
encfs /scratch/Dropbox/encrypted /home/christiane/dropbox
``` 

unmount
``` 
fusermount -u /home/christiane/dropbox
``` 


## truecrypt
Copy files, check signature, untar:
``` 
truecrypt-7.1a-linux-x64.tar.gz
truecrypt-7.1a-linux-x64.tar.gz.sig
``` 

Run:
``` 
./truecrypt-7.1a-setup-x64
``` 

