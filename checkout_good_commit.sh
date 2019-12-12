#!/bin/bash

cd /app
. venv/bin/activate
cd /faust
git checkout 7b4c47e82ed002bf6a8c2ffa6cc3442699f9dc4f 
pip3 install -e .
