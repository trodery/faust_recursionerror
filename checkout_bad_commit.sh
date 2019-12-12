#!/bin/bash

cd /app
. venv/bin/activate
cd /faust
git checkout b26490049891dc8cfc96f08f2ea7d3605906826d
pip3 install -e .
