#!/bin/bash
# set up system, install apps, change config files

# root privileges required
if [[ $EUID -ne 0 ]]; then
	echo "Root privileges required"       
	exit 1

# add repos

# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# install apps
snap install spotify
apt-get install \
	git curl gparted

# VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get install apt-transport-https
apt-get -y --force-yes update
apt-get install code # or code-insiders

# Miniconda
curl -O https://repo.continuum.io/miniconda/Miniconda3-4.5.12-Linux-x86-64.sh
bash Miniconda3-4.5.12-Linux-x86-64.sh

