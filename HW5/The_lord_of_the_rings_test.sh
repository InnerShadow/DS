#!/usr/bin/env bash

source yolov5env/bin/activate
wget -O test_video.mp4 'https://www.dropbox.com/scl/fi/39bwqpuhittcji1c8rrmx/test_video.mp4?rlkey=h15mvua3eagjamth7shgizbtj&dl=0' 

cd yolov5
python3 detect.py --weights runs/train/exp2/weights/best.pt --img 640 --conf 0.25 --sourse ../test_video.mp4

echo "Complete!"

