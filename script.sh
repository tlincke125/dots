#!/usr/bin/env sh

######################################################################
# @author      : theo (theo.j.lincke@gmail.com)
# @file        : script
# @created     : Tuesday Jan 19, 2021 21:29:35 MST
#
# @description : Setup
######################################################################

# Java
sudo apt install openjdk-8-jre

# Scala and jupyter lab
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt
sudo apt-get install scala
# Virtualenv
virtualenv -p python3 .venv
source .venv/bin/activate
pip3 install jupyterlab
pip3 install notebook
curl -Lo coursier https://git.io/coursier-cli
chmod +x coursier
./coursier launch --fork almond -- --install
rm -f coursier

# Snap
sudo apt update
sudo apt install snapd

# Discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i ./discord.deb

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# Bitwarden
sudo snap install bitwarden

# zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Make zsh default

# vim
cd .vim/bundle/YouCompleteMe
python3 install.py --all

# Zoom
wget -O Downloads/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom.deb
