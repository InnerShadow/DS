#!/usr/bin/env bash

python3 -m venv yolov5env
source yolov5env/bin/activate

git clone https://github.com/ultralytics/yolov5
pip3 install -U -r yolov5/requirements.txt

echo "Complete!"

