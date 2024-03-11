# HW5

## [**1. Train on base dataset**](/HW5/README.md#we-need-to-train-the-yolov5-model-on-the-standard-dataset-coco128-as-well-as-to-check-the-performance-of-the-trained-model)

## 

## We need to train the yolov5 model on the standard dataset coco128 as well as to check the performance of the trained model.

### Setup

[Script](/HW5/setup.sh)

In order to work correctly with yolov5, let's create a virtual environment in python, clone the repository from yolov5, and install the necessary dependencies. To do this, do the following:

```{bash}
bash setup.sh
```

### Data investigation

Investigae coco128 datast. We get:

45 0.479492 0.688771 0.955609 0.5955  
45 0.736516 0.247188 0.498875 0.476417  
50 0.637063 0.732938 0.494125 0.510583  
45 0.339438 0.418896 0.678875 0.7815   
49 0.646836 0.132552 0.118047 0.0969375  
49 0.773148 0.129802 0.0907344 0.0972292   
49 0.668297 0.226906 0.131281 0.146896  
49 0.642859 0.0792187 0.148063 0.148062  

The first column is the class label, the second column is the normalized x-coordinate of the top left corner, the third column is the normalized y-coordinate of the top left corner, the fourth column is the normalized width, and the fifth column is the normalized height.


### Model fitting

[Script](/HW5/coco_train.sh)

I will train yolov5 small version, get 2 images for each batch, set 64 epochs and confidence for object recognize in 0.25 and run *train.py* modul. To fit model use:

```{bash}
bash coco_train.sh
```

I will test model on Sherlock video fragment. First of all we need grab this video from dropbox(script will do itself) and run *detect.py* modul with coefficients of model that we train in *coco_train.sh* script. To test model use:

[Script](/HW5/coco_test.sh)

```{bash}
bash coco_test.sh
```

### Results

Model metrics on each epoch we can see [here](/HW5/Coco/coco_resualts.md).

Test batch detections:  

![](/HW5/Coco/coco_4.jpg)
![](/HW5/Coco/coco_10.jpg)

![](/HW5/Coco/coco_1.jpg)

F1-confidence curve:  
![](/HW5/Coco/coco_6.jpg)

![](/HW5/Coco/coco_8.jpg)

Confusion matrix:
![](/HW5/Coco/coco_12.jpg)

Precision-Recall Curve:
![](/HW5/Coco/coco_13.jpg)

Recall-confidance Curve
![](/HW5/Coco/coco_14.jpg)

![](/HW5/Coco/coco_15.jpg)
