#!/bin/bash
mkdir -p build && cd build
sudo apt install build-essential dpkg-dev
sudo apt install pulseaudio libpulse-dev
sudo apt build-dep pulseaudio
apt source pulseaudio
cd pulseaudio-$(pulseaudio --version | awk '{print $2}')
./configure
cd .. && $PROXY_CMD git clone https://github.com/neutrinolabs/pulseaudio-module-xrdp.git
cd pulseaudio-module-xrdp
./bootstrap && ./configure PULSE_DIR="$(pwd)/../pulseaudio-$(pulseaudio --version | awk '{print $2}')"
make -j2
sudo make install
sudo mkdir -p  /var/lib/xrdp-pulseaudio-installer
sudo cp ./src/.libs/*.so /var/lib/xrdp-pulseaudio-installer
