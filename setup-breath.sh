#!/bin/bash

# Install Google Chrome
cd ~
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Install Spotify
sudo apt install -y curl
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# Install Discord
cd ~
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i ./discord.deb
sudo apt-get -f install

# Setup audio
sudo wget https://raw.githubusercontent.com/runcros/breath/enh-skylake-audio/bin/setup-audio-skl -O /usr/local/bin/setup-audio-skl
sudo chmod +x /usr/local/bin/setup-audio-skl
sudo setup-audio-skl

# Setup Pipewire

sudo systemctl --user unmask pipewire.service
sudo systemctl --user unmask pipewire.socket
sudo systemctl --user enable pipewire.service
sudo systemctl --user enable pipewire.socket
sudo systemctl --user start pipewire.service
sudo systemctl --user start pipewire.socket
sudo apt install libspa-0.2-bluetooth libspa-0.2-jack  libspa-0.2-modules
sudo apt install pipewire-audio-client-libraries
sudo apt install wireplumber pipewire-media-session-
sudo systemctl --user --now enable wireplumber.service
sudo cp /usr/share/doc/pipewire/examples/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d/

# Reboot
sudo reboot
