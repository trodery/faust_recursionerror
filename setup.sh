#!/bin/bash

cd /app
python3 -m venv venv
. venv/bin/activate
pip3 install wheel
pip3 install -e /faust 

