#!/usr/bin/env bash

source yolov5env/bin/activate

wget -O train_data.tar.xz 'https://www.dropbox.com/scl/fi/1ser63wqsud1a2gw8t8a4/train_data.tar.xz?rlkey=eli0owun0nm5k1if62l2xtn84&dl=0'
tar -xf train_data.tar.xz
rm train_data.tar.xz

cp The_lord_of_the_rings.yaml yolov5/data/

cd yolov5

python3 train.py --img 640 --batch 2 --epochs 128 --data The_lord_of_the_rings.yaml -- weights yolov5s.pt --cache

echo "Complete!"

