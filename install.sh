#!/bin/sh

# Python 3
apt-get install python3 -y
apt-get install python3-pip -y

# Development dependencies
apt-get install libatlas-base-dev -y
apt-get install flac -y
apt-get install git -y

# Local Speech recognition dependencies
apt-get install libhdf5-serial-dev -y
apt-get install swig -y
apt-get install pulseaudio -y
apt-get install libpulse-dev -y
apt-get install libasound2-dev -y

# Artificial inteligence package
git clone https://github.com/aiforiot/artificial_inteligence.git
pip3 install -r artificial_intelligence/requeriments.txt  -y


