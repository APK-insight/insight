#!/bin/bash

set -e # stop when error occurs
set -x # show progress

jadx_zip_file="jadx-0.6.0.zip"

sudo apt-get update
sudo apt-get -y install git python-pip python-virtualenv


# Setting up jadx
mkdir -p src/jadx
wget -P src/jadx https://github.com/skylot/jadx/releases/download/v0.6.0/$jadx_zip_file

cd src/jadx
unzip $jadx_zip_file


# Setting up ssdc
cd ../../; mkdir -p src/ssdc
git clone https://github.com/deanboole/ssdc.git src/ssdc

virtualenv src/ssdc
    source src/ssdc/bin/activate
    pip install pydeep
    cd src/ssdc/
    python setup.py install
deactivate
