#!/bin/bash
# set up system, install apps, change config files

# root privileges required
if [[ $EUID -ne 0 ]]; then
	echo "Root privileges required"       
	exit 1
fi

set +x

# add repos

echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo Setting up my common directories
mkdir -p ~/repo

# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade
echo Updated and upgraded.

# install apps
for app in git curl gparted vim neovim yakuake gcc tmux steam-installer; do
	echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	echo Installing $app
	apt install $app
done

# VS Code
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo Installing VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
apt-get install apt-transport-https
apt-get update
apt-get install code # or code-insiders
echo VS Code installed.

# Miniconda
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo Installing Miniconda
curl -O https://repo.continuum.io/miniconda/Miniconda3-4.5.12-Linux-x86-64.sh
bash Miniconda3-4.5.12-Linux-x86-64.sh
echo Miniconda installed.

# Flatpak
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo Installing flatpak
apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo flatpak installed.

# Zotero
# flatpak install -y flathub org.zotero.Zotero

# Spotify
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo Installing Spotify
flatpak install -y flathub com.spotify.Client
echo Spotify installed.

# Steam
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo Installing steam-installer
apt-get install steam-installer
echo steam-installer installed. Run steam-installer to install Steam.

# Vivaldi
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo Installing Vivaldi
curl -O https://downloads.vivaldi.com/stable/vivaldi-stable_7.1.3570.58-1_amd64.deb

echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo Setting up Neovim config
# Install Kickstart Nvim dependencies
apt install -y git make unzip gcc ripgrep
git clone git@github.com:mjancen/kickstart.nvim.git ~/repo/maksim-kickstart
ln -s $HOME/repo/maksim-kickstart $HOME/.config/nvim

echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
./create-config-links.sh
echo Config file links created.

echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo "Post-installation process finished."
echo "Time for a reboot!"


