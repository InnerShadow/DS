# **HW2**

### [**1. Clustering task**](#1-perform-hierarchical-clustering-and-dbscan-using-the-example-of-a-dataset-on-the-distribution-of-penguins-by-type-use-umap--lda-to-reduce-feature-space)
### [**2. Autoencoder**](#2-create-an-autoencoder-for-dimensionality-reduction-of-molecular-illustrations-in-chemical-education)

##

## **1. Perform hierarchical clustering and DBSCAN using the example of a dataset on the distribution of penguins by type. Use UMAP & LDA to reduce feature space.**

### [**Data set**](https://www.kaggle.com/datasets/youssefaboelwafa/clustering-penguins-species)

### [**Code**](Clustering.ipynb)

### Data Preprocessing
 A dataset with penguin characteristics was selected, including culmen_length_mm, culmen_depth_mm, flipper_length_mm, body_mass_g, and sex. The data contained some missing values, 2 for each feature except for sex, where 9 values were missing. Missing data were removed from the dataset. The categorical feature sex was then encoded with values (0, 1), where 0 represents female and 1 represents male. Descriptive statistics revealed that the flipper_length_mm column contained incorrect values, such as -132 mm or 5000 mm; these records were also removed. The data were normalized, and Principal Component Analysis (PCA), UMAP 2D & 3D, LDA were applied to reduce feature space.

### Data Visualization 
 Histograms depicting the distribution of each parameter and box plots were generated.

### Clustering Models
 1. DBSCAN model was trained. DBSCAN identifies clusters of arbitrary shapes and automatically determines their number. It is based on the epsilon neighborhood of a point (U(x) = {u in U: ro(x, u) <= epsilon}). Three types of objects are identified: core, boundary, and noise. A random object is chosen, and its epsilon neighborhood is examined. If it contains fewer than 'm' other objects, it is marked as potential noise (if not assigned to any cluster, it remains noise). The process is repeated recursively. After the algorithm, clusters and noise points are obtained. The number of clusters is automatically determined from specified parameters. Parameters chosen were: epsilon = 1 and the minimum number of objects to form a core cluster = 5. Metrics were collected. DBSCAN detected 4 clusters and 2 outliers. A graph was plotted with principal components on the axes, and clusters were differentiated by color.
 2. Hierarchical clustering was attempted. Objects were initialized as individual clusters, and neighboring objects were successively merged. Agglomeration, using the Lance-Williams formula, described the distance between clusters during agglomeration. The hierarchical clustering algorithm requires the number of clusters as a hyperparameter. Since DBSCAN showed 4 clusters, AgglomerativeClustering was set to 4 clusters. A graph was plotted with principal components on the axes, and different clusters were differentiated by color. A dendrogram illustrating the merging process into clusters was also created. Metrics were collected.
 3. As 'Garant' K-means was choosen. Metrics were collected. Since DBSCAN showed 4 clusters, K-means n_clusters was set to 4 clusters. A graph was plotted with principal components on the axes, and clusters were differentiated by color.

### Reduce feature space
To reduce the dimensionality of the feature space, three methods were employed:
1. PCA: Applying the DBSCAN algorithm revealed 4 clusters in the data transformed by PCA. Metrics were also collected. Despite other transformation approaches, PCA did not outperform in this context.
2. UMAP: UMAP was employed to reduce the feature space initially to 2 dimensions and then to 3 dimensions. UMAP indicated the presence of 6 penguin species, unlike using PCA, while detected only 4 clusters. Metrics further demonstrated that clustering for 6 groups was more accurate than for 4.
3. LDA: While LDA is typically used for supervised learning and may not be ideal for clustering tasks. But exploring UMAP allowed to obtain class labels. For instance, using K-means on UMAP results provides labels that can be considered as target values. A 3-dimensional UMAP vector was inputted, and an attempt was made to reduce the feature space to 2 dimensions.

### Metrics
 1. Silhouette Score: Evaluates how similar objects within clusters are and how different objects in different clusters are. Scores range from -1 to 1, with higher values indicating denser and more distinct clusters.
 2. Homogeneity, Completeness, V-measure: Used for multi-class clustering. Homogeneity measures how much each cluster consists of objects from one class, Completeness measures how well all objects of one class belong to one cluster, and V-measure is their harmonic mean.
 3. Calinski-Harabasz Index: Measures the ratio of variance within clusters to variance between clusters. A higher index value usually indicates better clustering.

The measurement table is presented below.

| Model | Reduce method | Num clusters |Silhouette Score | Homogeneity | Completeness | V-measure | Calinski-Harabasz Index |
|:-------:|:---------------:|:-:|:----------------:|:-------------:|:--------------:|:-----------:|:-------------------------:|
| DBSCAN | PCA          | 4 |0.49            | 0.24        | 0.99         | 0.38      | 278.77                  |
| AgglomerativeClustering   | PCA |  4 |  0.51  | 0.24        | 0.99         | 0.38      | 363.97                  |
| KMeans | PCA         | 4 | 0.51 | 0.24 | 0.99 | 0.38 | 363.97 |
| DBSCAN    | UMAP 2D | 5 | 0.52    | 0.27    | 0.99 | 0.42 | 389.18 |
| AgglomerativeClustering   | UMAP 2D | 6 | 0.53    | 0.30    | 0.99 | 0.46 | 435.02 |
| KMeans | UMAP 2D | 6 | 0.53 | 0.30 | 0.99 | 0.46 | 434.97 |
| DBSCAN    | UMAP 3D | 6 | 0.53    | 0.30    | 0.99 | 0.46 | 435.02 |
| AgglomerativeClustering   | UMAP 3D |  6 | 0.53    | 0.30    | 0.99 | 0.46 | 435.02 |
| KMeans | UMAP 3D | 6 | 0.53 | 0.30 | 0.99 | 0.46 | 435.02 |
| DBSCAN    | LDA | 6 | 0.53    | 0.30    | 0.99 | 0.46 | 435.02 |
| AgglomerativeClustering   | LDA | 6 | 0.53    | 0.30    | 0.99 | 0.46 | 435.02 |


## **2. Create an autoencoder for dimensionality reduction of molecular illustrations in chemical education.**

### [**Code**](Autoencoder.ipynb)

### Dataset
 No suitable datasets with chemical molecule images were found in open sources, so a decision was made to generate a custom dataset. The RDKit library was installed for this purpose. Fifty different images of molecules, sized 128x128 pixels, were generated, including alkanes, acids, salts, hydroxides, amines, and others. Additionally, 1050 images were generated with data augmentation, including zooming and rotation. To expedite training and find the best model, initial training was performed on black and white photos. After finding suitable model parameters, training was conducted on colored images. The data was also split into test and training sets.

### Image EDA 
A set of images, comprising both original and augmented versions, was organized into clusters. Initially, the pixel matrix was flattened into a vector, followed by the application of the UMAP algorithm for dimensionality reduction. Subsequently, the DBSCAN clustering method was employed, as it automatically determines the number of clusters. In the end, 9 clusters emerged, and here is a descriptive breakdown:
1. Cluster 0 encompasses molecules with simple structures and exhibits a wide variance in molecule types.
2. Cluster 1 features 'x'-like structures.
3. Cluster 2 consists of molecules with benzene rings.
4. Cluster 3 includes molecules with numerous bends.
5. Cluster 4 comprises molecules with a central spot and three lines in different directions.
6. Cluster 5 contains 'x'-like molecules but with an elongated central part.
7. Cluster 6 comprises simple molecular structures with a lack of bends.
8. Cluster 7 includes formic acid molecules.
9. Cluster 8 contains benzylamine molecules; typically, the benzene ring is severed, leading DBSCAN to form a separate cluster.

### Models
 Eleven models were created. After training each model, learning process graphs and 10 images in the format (original image - reconstructed image) were generated. Early stopping was applied to each model to prevent overfitting. It is essential to note that all models have relatively low metrics, such as 0.0404, but it should be understood that the images contain a lot of white background, contributing to the low metric.

1. Model #1 - Simple fully connected autoencoder. Neuron count on each layer: input image - 512 - 256 - 128 - encoder(512) - 128 - 256 - 512 - decoded image. Best loss metric during training - 0.0404 achieved at the 30th epoch. The autoencoder performs poorly, with mostly discernible molecular silhouettes but not letters. Incorrectly decoded molecules are also present.
2. Model #2 - Attempt to complicate the model. Also a fully connected autoencoder with increased neuron count on layers. Neuron count on each layer: input image - 2048 - 1024 - encoder(512) - 1024 - 128 * 128 - decoded image. Best loss metric achieved was 0.0297 at the 37th epoch. Images improved, with well-decoded letters visible in some areas, but overall quality still needs improvement.
3. Model #3 - Attempt to simplify the model. A simplified fully connected neural network with fewer neurons. Best loss metric of 0.0303 was achieved at the 45th epoch. The simplified model performed better than model #1 but worse than model #2. Neuron count on each layer: input image - 256 - 128 - encoder(64) - 128 - 256 - 128 * 128 - decoded image. Image boundaries became more visible, but overall quality is still quite poor.
4. Model #4 - Attempt to transition to convolutional neural networks. Best loss metric of 0.0034 was achieved at the 25th epoch, a tenfold improvement compared to fully connected neural networks. Autoencoder structure: input image - 16 kernels 3x3 - MaxPooling2D by 2 - 32 kernels 3x3 - MaxPooling2D by 2 - 64 kernels 3x3 - encoder(MaxPooling2D by 2) - 64 kernels 3x3 - UpSampling2D by 2 - 32 kernels 3x3 - UpSampling2D by 2 - 16 3x3 kernels - UpSampling2D by 2 - decoded image. Images became clear, with visible molecule boundaries and letters.
5. Model #5 - Attempt to increase kernel size on the input layer to improve the metric. Best loss metric of 0.0027 was achieved at the 25th epoch. Autoencoder structure: input image - 16 kernels 5x5 - MaxPooling2D by 2 - 32 kernels 3x3 - MaxPooling2D by 2 - 64 kernels 3x3 - encoder(MaxPooling2D by 2) - 64 kernels 3x3 - UpSampling2D by 2 - 32 kernels 3x3 - UpSampling2D by 2 - 16 5x5 kernels - UpSampling2D by 2 - decoded image. The metric increased compared to 3x3 kernels on the first layer, addressing the large white space contributing to the overall low metric.
6. Model #6 - Attempt to increase kernel size on both layers. Best loss metric of 0.0027 was achieved at the 25th epoch. Autoencoder structure: input image - 16 kernels 5x5 - MaxPooling2D by 2 - 32 kernels 5x5 - MaxPooling2D by 2 - 64 kernels 3x3 - encoder(MaxPooling2D by 2) - 64 kernels 3x3 - UpSampling2D by 2 - 32 kernels 5x5 - UpSampling2D by 2 - 16 5x5 kernels - UpSampling2D by 2 - decoded image. The metric remained the same as in model #5, indicating that further model complexity may not be beneficial.
7. Model #7 - The best-trained model (model #5) was selected and trained for 50 epochs instead of 25. Loss metric of 0.0017 was achieved at the 50th epoch. The images became of decent quality.
8. Model #8 - The same structure as model #7, attempting to transition to RGB images. The structure is the same as in model #7, with input and output images decomposed into three digital components. Loss metric of 0.0028 was achieved at the 37th epoch. The metric decreased due to the transition from black and white to color images.
9. Model #9 - The same structure as model #8, with BatchNormalization added after each Conv2D layer to improve the model's generalization capabilities. Loss metric of 0.0021 was achieved at the 41st epoch. All kernels were displayed, showing how the encoder encodes all images. The original 128x128 image is compressed using 64 kernels with a size of 16x16 - meaning no compression.
10. Model #10 - Attempt to decrease the number of kernels at the encoder output to 16. Autoencoder structure: input image - 64 kernels 5x5 - MaxPooling2D by 2 - 48 kernels 3x3 - MaxPooling2D by 2 - 16 kernels 3x3 - encoder(MaxPooling2D by 2) - 64 kernels 3x3 - UpSampling2D by 2 - 48 kernels 3x3 - UpSampling2D by 2 - 16 5x5 kernels - UpSampling2D by 2 - decoded image. Loss metric of 0.0030 was achieved at the 30th epoch. Loss increased by 0.0007, but now the encoder encodes the message into 16 kernels sized 16x16 pixels, compressing the image four times. Heatmaps were also created to overlay encoded and original images, revealing areas where the model makes errors.
11. Model #11 - Attempt to further decrease the number of kernels at the encoder output to 8. Autoencoder structure: input image - 64 kernels 5x5 - MaxPooling2D by 2 - 48 kernels 3x3 - MaxPooling2D by 2 - 16 kernels 3x3 - 8 kernels 3x3 - encoder(MaxPooling2D by 2) - 64 kernels 3x3 - UpSampling2D by 2 - 48 kernels 3x3 - UpSampling2D by 2 - 16 5x5 kernels - UpSampling2D by 2 - decoded image. Loss metric of 0.0042 was achieved at the 23rd epoch. Heatmaps were also created to overlay encoded and original images, revealing areas where the model makes errors. Compression is now 8 times, but the image is poorly reconstructed. Model #10 remains the best.

### Results

| Model # | Epochs | Loss | Colarization | Compression | BatchNormalization |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 | 30 | 0.0404 | Grayscale | 32 | No |
| 2 | 36 | 0.0287 | Grayscale | 32 | No |
| 3 | 45 | 0.0303 | Grayscale | 256 | No |
| 4 | 25 | 0.0034 | Grayscale | 1 | No |
| 5 | 25 | 0.0027 | Grayscale | 1 | No |
| 6 | 25 | 0.0027 | Grayscale | 1 | No |
| 7 | 50 | 0.0017 | Grayscale | 1 | No |
| 8 | 37 | 0.0028 | RGB | 1 | No |
| 9 | 40 | 0.0023 | RGB | 1 | Yes |
| 10 | 30 | 0.0030 | RGB | 4 | Yes |
| 11 | 23 | 0.0042 | RGB | 8 | Yes |


