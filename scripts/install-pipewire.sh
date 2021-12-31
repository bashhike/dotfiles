#! /bin/bash

# Script for the installation of pipewire, which is a replacement for
# pulseaudio and provides better support for aptx and spatial audio.

# Add ppa repo for pipewire.
sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream -y

# Add packages.
sudo apt update && sudo apt install pipewire libspa-0.2-bluetooth \
    pipewire-audio-client-libraries

# Reload the daemon and enable pipewire.
systemctl --user daemon-reload
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user mask pulseaudio

systemctl --user --now enable pipewire-media-session.service

# Remove ofono and phonesim if they are installed.
sudo apt remove ofono ofono-phonesim -y

# Restart pipewire.
systemctl --user restart pipewire

