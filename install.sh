#!/bin/sh

# Python 3
apt-get install python3
apt-get install python3-pip

# Development dependencies
apt-get install libatlas-base-dev
apt-get install flac
apt-get install git

# Local Speech recognition dependencies
apt-get install libhdf5-serial-dev
apt-get install swig
apt-get install pulseaudio
apt-get install libpulse-dev
apt-get install libasound2-dev

# Artificial inteligence package
git clone https://github.com/aiforiot/artificial_inteligence.git
pip3 install -r artificial_intelligence/requeriments.txt


