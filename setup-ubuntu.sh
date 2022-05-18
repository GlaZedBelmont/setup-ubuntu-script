#!/bin/bash

# Install git
sudo apt install git

# Setup audio
cd ~ 
git clone https://github.com/devendor/c302ca
cd /lib/firmware/intel
sudo ln -sf dsp_fw_release_v969.bin dsp_fw_release.bin
sudo install ~/c302ca/fs/etc/apt/apt.conf.d/98old-firmware /etc/apt/apt.conf.d/98old-firmware
sudo cp ~/c302ca/fs/lib/firmware/skl_n88l25_m98357a-tplg.bin /lib/firmware/
sudo cp -r ~/c302ca/fs/usr/share/alsa/ucm2/sklnau8825max /usr/share/alsa/ucm2/
sudo chmod -R +r /usr/share/alsa/ucm2/sklnau8825max

# Install Google Chrome
cd ~
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Remove Firefox
sudo apt purge firefox

# Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# Install Discord
cd ~
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i ./discord.deb
