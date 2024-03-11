#!/usr/bin/env bash

source yolov5env/bin/activate

cd yolov5
python3 train.py --img 640 --batch 2 --epochs 64 --data coco128.yaml --weights yolov5s.pt --cache

echo "Complete!"

