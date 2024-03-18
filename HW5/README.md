# HW5

## [**1. Train on base dataset**](/HW5/README.md#part-1--we-need-to-train-the-yolov5-model-on-the-standard-dataset-coco128-as-well-as-to-check-the-performance-of-the-trained-model)
## [**2. Trin on custom dataset**](/HW5/README.md#part-2-creating-a-custom-dataset-annotation-and-yolov5-model-training)

## 

## Part 1 : we need to train the yolov5 model on the standard dataset coco128 as well as to check the performance of the trained model.

### Setup

In order to work correctly with yolov5, let's create a virtual environment in python, clone the repository from yolov5, and install the necessary dependencies. To do this use [script](/HW5/setup.sh):

```bash
bash setup.sh
```

### Data investigation

Investigae coco128 datast. We get:

45 0.479492 0.688771 0.955609 0.5955   

The first column is the class label, the second column is the normalized x-coordinate of the top left corner, the third column is the normalized y-coordinate of the top left corner, the fourth column is the normalized width, and the fifth column is the normalized height.


### Model fitting

I will train yolov5 small version, get 2 images for each batch, set 64 epochs and confidence for object recognize in 0.25 and run *train.py* modul. To fit model use [script](/HW5/coco_train.sh): 

```bash
bash coco_train.sh
```

Best mAP_0.5 is 0.866.

I will test model on Sherlock video fragment. First of all we need grab this video from dropbox(script will do itself) and run *detect.py* modul with coefficients of model that we train in *coco_train.sh* script. To test model use [script](/HW5/coco_test.sh):

```bash
bash coco_test.sh
```

### Results

#### Show low FPS gif fragment:
![](/HW5/Coco/video_res_gif.gif) 

#### The full video is available [here](https://www.dropbox.com/scl/fi/4gm51wsf362phe1jnypcd/video_res.mp4?rlkey=cyrcc38k5a0ij2nkmlrnkc5r4&dl=0)

#### Test batch detections:  
![](/HW5/Coco/coco_4.jpg)
![](/HW5/Coco/coco_10.jpg)

#### Results
![](/HW5/Coco/coco_1.jpg)

#### F1-confidence curve:  
![](/HW5/Coco/coco_6.jpg)

#### Labels
![](/HW5/Coco/coco_8.jpg)

####  Confusion matrix:
![](/HW5/Coco/coco_12.jpg)

#### Precision-Recall Curve:
![](/HW5/Coco/coco_13.jpg)

#### Recall-confidance Curve
![](/HW5/Coco/coco_14.jpg)

#### Labels correlogram
![](/HW5/Coco/coco_15.jpg)

## 

## Part 2: Creating a Custom Dataset, Annotation, and YOLOv5 Model Training

### Data Preparation

The task chosen for training data was facial recognition. The movie "The Lord of the Rings: The Fellowship of the Ring" was selected as the training dataset, with actors' faces playing the characters: *Frodo Baggins, Sam Gamgee, Peregrin Took, Merry Brandybuck, Gandalf, Gimli, Legolas, Aragorn, Boromir*. Initially, 252 images were collected featuring the selected characters. Subsequently, using a [script](/HW5/resize_images.py), the data was divided into 90% for training and 10% for testing, and image resolutions were reduced by a factor of 3 for each coordinate. Additionally, a [yaml](/HW5/The_lord_of_the_rings.yaml) file was created containing descriptions of classes and paths to training and testing data. Following this, the data was annotated in YOLO format.

### Model training

To train the model, a [script](/HW5/The_lord_of_the_rings_train.sh) was utilized. This script downloads preprocessed images with annotations, moves the [yaml](/HW5/The_lord_of_the_rings.yaml) file to the required directory, and initiates the training process. Perform 128 epochs with 2 batch_size.

```bash
bash The_lord_of_the_rings_train.sh
```

### Model testing

To assess the model's performance, a clip from the actual movie, accessible via [link](https://www.dropbox.com/scl/fi/39bwqpuhittcji1c8rrmx/test_video.mp4?rlkey=h15mvua3eagjamth7shgizbtj&dl=0), and a small segment of this video in GIF format were chosen. Full process video is avalible [here](https://www.dropbox.com/scl/fi/l9c712b0g96cwxdxusmcz/test_video__.mp4?rlkey=tudjvpruwcg8eti2n5vyhciq3&dl=0). Bash [scrit](/HW5/The_lord_of_the_rings_test.sh) to do this:

```bash
bash The_lord_of_the_rings_test.sh
```

#### Show low FPS gif fragment:

![](/HW5/The_lord_of_the_rings/res.gif)

#### Test batch detections:  
![](/HW5/The_lord_of_the_rings/3.jpg)
![](/HW5/The_lord_of_the_rings/4.jpg)

#### Labels correlogram
![](/HW5/The_lord_of_the_rings/2.jpg)

#### Labels
![](/HW5/The_lord_of_the_rings/1.jpg)

####  Confusion matrix:
![](/HW5/The_lord_of_the_rings/8.jpg)

#### Tensorboard results:
![](/HW5/The_lord_of_the_rings/5.jpg)
![](/HW5/The_lord_of_the_rings/6.jpg)

#### Tensorboard model performanse:
![](/HW5/The_lord_of_the_rings/7.jpg)

### Conclusions
The model correctly identifies most of the selected characters, however, due to not all characters appearing in the frame being present in the training dataset, it misidentifies Lord Celeborn as Legolas, or Boromir instead. Additionally, it confuses between Peregrin Took and Merry Brandybuck, assigning them with a 50% probability, just like I do...