# Ubuntu 20.04 Initial Configurations

Here's what I do to make Ubuntu the way I like it:

```
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Switch ctrl and Fn keys in BIOS
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Aspire 5 touchpad not recognized
# no idea what I did
# went to Windows, downloaded I/O driver from Acer website
# got errors during install
# after some reboots, touchpad was back in Windows and also
# in Ubuntu
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# default editor
su
apt-get update
apt-get install vim
update-alternatives --config editor
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# terminal bell
# go into terminal preferences and disable terminal bell in profiles
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
sudo apt-get install aptitude gdebi
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# install chrome: download .deb from google.com/chrome
su
cd /usr/bin
ln -sf google-chrome chrome
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# change permissions on /scratch
su
chown christiane:christiane /scratch
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# change Desktop background
# Go to Settings and change the picture
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# keyboard shortcuts in Settings -> Keyboard -> Shortcuts
- add xkill
DONE
- add maximize vertically (alt+w)
DONE
- new terminal shortcut change to super+n,
DONE
# Application vs Window switcher
- Switch Applications Alt-Tab groups windows
- Switch windows of an application Alt+`
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# copy files
# copy home
DONE
# move pictures, movies, music, literature, downloads to scratch
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Browser 
- move old .mozilla preference folder to new installation
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- enable backspace in firefox --> about:config look for
  "backspace action" or so and set to 0 
- also in Chrome
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# git
sudo apt install git
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# mutt
sudo apt install mutt mutt-vc-query rolo
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ssh => change permissions on private keys
chmod 600 id_rsa
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# permissions on .gnupg
# Set ownership to your own user and primary group
chown -R "$USER:$(id -gn)" ~/.gnupg
# Set permissions to read, write, execute for only yourself, no others
chmod 700 ~/.gnupg
# Set permissions to read, write for only yourself, no others
chmod 600 ~/.gnupg/*
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# show seconds and date in status bar:
gsettings set org.gnome.desktop.interface clock-show-seconds true
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# disable overlay scrollbars
vi /home/christiane/.profile # add the following two lines; then logout/login
export GTK_OVERLAY_SCROLLING=0
gdbus call --session --dest org.freedesktop.DBus --object-path /org/freedesktop/DBus --method org.freedesktop.DBus.UpdateActivationEnvironment '{"GTK_OVERLAY_SCROLLING": "0"}'
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CTRL ALT BACKSPACE
- enable x server kill (ctrl alt backspace) 
  sudo dpkg-reconfigure keyboard-configuration
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# enable completion of apt-get / aptitude install
sudo apt-get install bash-completion
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# tor: download bundle from https://www.torproject.org/
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Dropbox
sudo vi /etc/apt/sources.list.d/dropbox.list
# Add the following line to this file.
deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu bionic main
# save and close
# add apt-key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
install dropbox ubuntu 20.04 LTS
sudo apt update
sudo apt install python3-gpg dropbox
# create mountpoint in ~/
mkdir ~/dropbox
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# support encfs encryption
sudo apt-get install encfs
- mount encrypted volumes
encfs /scratch/Dropbox/encrypted /home/christiane/dropbox
- unmount
fusermount -u /home/christiane/dropbox
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# canberra-gtk module missing
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# markdown viewer
# install "Markview Preview Plus" extension in Chrome and allow
# local access to URLs in the extension settings
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reinstall truecrypt
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# print to pdf
sudo aptitude install printer-driver-cups-pdf
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# .heif to JPG conversion
sudo apt-get update
sudo apt-get install libheif-examples
for file in *.heic; do heif-convert $file ${file/%.heic/.jpg}; done
DONE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# eid viewer
See my eid-howto.md on github
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
```
