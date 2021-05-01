#!/bin/bash
# Works on Ubuntu 20.04
# Source: https://owendavies.net/articles/install-jupyter-notebook-on-ubuntu/
sudo apt-get update && sudo apt-get upgrade
# Install python
sudo apt install python3-pip python3-dev
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv
# Create virtual environment
virtualenv jupyterenvironment 
source jupyterenvironment/bin/activate 
# Install
pip install jupyter
pip install nbconvert
# Start with 'jupyter'
## Remove with 
## sudo pip3 uninstall virtualenv
