#!/usr/bin/env bash

source yolov5env/bin/activate

wget -O video.mp4 https://www.dropbox.com/scl/fi/053yt3wl89nva8loxc1r9/video.mp4?rlkey=7c8d3x86hf9f24y6em90j70ie&dl=0
sleep 20

cd yolov5
python3 detect.py --weights yolov5s.pt --img 640 --conf 0.25 --source ../video.mp4

echo "Complete!"

