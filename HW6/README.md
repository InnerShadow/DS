# HW6

## Create a neural network model to predict the next frame in an animated cartoon. Let's compare a transformer model with a non-transformer model.

## [**Code**](/HW6/Transformer.ipynb)

### Dataset
A single episode from the cartoon series "Adventure Time" was used as input data. The video was split into frames, every 6th frame was taken, and each image was compressed by a factor of 8. This resulted in 2074 frames. The data was then normalized to a range of 0 to 1. Sequences of 16 previous frames were created as feature space, with the next frame as the target variable. The data was split into training and testing sets.

### Non-transformer recurrent model
The model consists of 3 convolutional layers. Between the layers, there is a MaxPooling3D layer, which compresses the image by a factor of 2 in both dimensions while keeping the number of frames unchanged, along with a BatchNormalization layer. Then, using a Flatten layer, all frames are flattened into a vector and fed into a fully connected layer with 1024 neurons. This layer is then connected to the output of the model, which predicts the next frame. Early stopping was applied to prevent overfitting. The model was compiled with the Adam optimizer and mean squared error (MSE) loss function. The best metric, with a loss of 0.0199, was achieved at the 82nd epoch.

### Transformer
The neural network model remained the same, but an Attention layer was added between the convolutional layer and MaxPooling3D. This Attention layer uses the convolutional layer's output as the query and the current frame as the key. This is done before MaxPooling3D to ensure the dimensions of the vectors match. Result: loss was 0.0216 after 100 epochs of training. Although the metric was slightly lower, I observed an increase in contrast and detail enhancement after "visual atack" inspecting the images.