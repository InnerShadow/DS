# **HW3**

### [**1. Binary classification**](#1-solve-binary-classification-task-using-pycaret-automl)
### [**2. Multiclass classification**](#2-solve-multiclass-classification-task-using-pycaret-automl)
### [**3. Clustering**](#3-solve-clustering-task-using-pycaret-automl)
### [**4. Regression**](#4-solve-regression-task-using-pycaret-automl)
### [**5. NLP multiclass classification**](#5-solve-nlp-multiclass-classification-task-using-pycaret-automl)

##

## 1. Solve binary classification task using pycaret AutoML. 

### [**Code**](/HW3/Binary_Classification_AutoML.ipynb)

### Dataset
The dataset was extracted from default pycaret datasets - blood, containing features like Recency, Frequency, Monetary, Time, and the target variable - Class.

### Data Preprocessing
Histograms of the distribution for each feature, boxplots for each feature, and Pearson and Kendall correlation matrices were generated.

### Model Training

1. Data was input into the model as-is. The best F1 metric was 0.3678 for the Gradient Boosting Classifier.
2. The Monetary feature was dropped due to its functional dependency on the Frequency feature. The best F1 metric was 0.3693 for the Gradient Boosting Classifier.
3. Class imbalance was addressed using the upsampling method for the target variable. The best F1 metric was 0.9601 for the Extra Trees Classifier.

### Results Visualization
ROC curves, confusion matrices, class prediction errors, learning curves, and feature importance plots were generated. A screenshot from the local run of mlflow was provided for each experiment.

### Resualts
| # | Best model | F1-score |
|:-:|:-:|:-:|
| 1 | Gradient Boosting Classifier | 0.3678 |
| 2 | Gradient Boosting Classifier | 0.3693 |
| 3 | Extra Trees Classifier | 0.9601 |

##

## 2. Solve multiclass classification task using pycaret AutoML.

### [**Code**](/HW3/Multiclass_Classification_AutoML.ipynb)

### Dataset
A default pycaret dataset - glass, containing glass parameters such as RI, Na, Mg, Al, Si, K, Ca, Ba, Fe, and the target variable - Type.

### Data Preprocessing
Histograms of the distribution for each feature, boxplots for each feature, and Pearson and Kendall correlation matrices were generated.

### Model Training

1. Data was input into the model as-is. The best F1 metric was 0.7470 for the Extra Trees Classifier.
2. Outliers from the Al, Fe, and K features were removed. The best F1 metric was 0.7615 for the Extra Trees Classifier.

### Results Visualization
ROC curves, confusion matrices, class prediction errors, learning curves, and feature importance plots were generated. A screenshot from the local run of mlflow was provided for each experiment.

### Resualts
| # | Best model | F1-score |
|:-:|:-:|:-:|
| 1 | Extra Trees Classifier | 0.7470 |
| 2 | Extra Trees Classifier | 0.7615 |

## 

## 3. Solve clustering task using pycaret AutoML.

### [**Code**](/HW3/Clustering_AutoML.ipynb)

### Clustering

### Dataset
A default pycaret dataset - pokemon, containing features: #, Name, Type 1, Type 2, Total, HP, Attack, Defense, Sp. Atk, Sp. Def, Speed, Generation, Legendary.

### Data Preprocessing
Features # and Name were dropped due to their lack of informativeness. Boxplots were generated for each feature. Features 'Type 1', 'Type 2', 'Legendary' were encoded using LabelEncoder to make them categorical. An elbow method diagram was constructed, suggesting an optimal cluster count of 6.

### Model Training

1. Raw data was passed to pycaret for various clustering algorithms: kmeans, ap, meanshift, sc, hclust, dbscan, optics, birch. The best models were kmeans and birch with Calinski-Harabasz scores of 172.6402 and 170.6474, respectively.
2. Pycaret suggested 4 clusters, but I believe 6 clusters are more suitable. I ran pycaret on 6 clusters for the two best models, obtaining metrics of 141.6419 and 125.6700, indicating that 4 clusters are indeed optimal. To reinforce this conclusion, I asked pycaret to display the elbow method, which also showed that 4 clusters are optimal.
3. Attempted dimensionality reduction using the umap method, first on an arbitrary number of components, then on 2 components, where 4 clusters are clearly visible. Trained kmeans and birch on umap-compressed data, obtaining metrics of 926.8205 and 851.5435, respectively.

### Results Visualization
Silhouette plots and cluster plots were generated.
A screenshot from the local run of mlflow was provided for each experiment.

### Resualts
| # | Calinski-Harabasz for kmean | Num clusters |
|:-:|:-:|:-:|
| 1 | 172.6402 | 4 |
| 2 | 141.6419 | 6 |
| 3 | 926.8205 | 4 |

## 

## 4. Solve regression task using pycaret AutoML.

### [**Code**](/HW3/Regression_AutoML.ipynb)

### Dataset
The dataset was taken from default pycaret datasets - diamond, containing features such as Carat Weight, Cut, Color, Clarity, Polish, Symmetry, Report, and the target variable - Price.

### Data Preprocessing
All features except Carat Weight are categorical. LabelEncoder was applied to make them understandable for the machine learning model. Pearson and Kendall correlation matrices were generated. Boxplots were displayed for real-valued features.

### Model Training
Models were given the data as-is. The best R2 metric was achieved with the Light Gradient Boosting Machine model. The metric is high, and there is no need for further improvement.

### Results Visualization
Prediction error, residuals, and feature importance plots were generated. A screenshot from the local run of mlflow for the experiment was provided.

### Resualts
| # | Best model | R2-score |
|:-:|:-:|:-:|
| 1 | lightgbm | 0.9813 |

##

## 5. Solve NLP multiclass classification task using pycaret AutoML.

### [**Code**](/HW3/NLP_AutoML.ipynb)

### Dataset
A default pycaret dataset - wikipedia, containing Title, Category, Text.

### Data Preprocessing
Rows that do not contain the target variable were dropped since attempting to predict manually engineered data might not be the best idea. A Word Cloud was generated.

### Model Training
0. General preprocessing for each model: Data was converted to lowercase, stop words were removed, and lemmatization was applied.
1. A Bag of Words was created, and the tf-idf coefficient was calculated. To avoid having 61,000 features, only the first 1000 significant words according to tf-idf were kept. These values were multiplied by the values from the Bag of Words. The best F1 score was 0.1323 with the Decision Tree Classifier.
2. An attempt was made to reduce the number of words from 1000 to 250, resulting in F1 scores of 0.0916 for the Extra Trees Classifier and Quadratic Discriminant Analysis. Everything worsened.
3. The decision was made to abandon Bag of Words and TF-IDF in favor of LDA to extract topics from the texts. Started with 20 topics, achieving an F1 score of 0.3650 with the Random Forest Classifier.
4. Increased the number of topics to 50, resulting in an F1 score of 0.4996 with the Random Forest Classifier.
5. Normalized the class distribution by upsampling and downsampling each class to 44 values. Achieved the best F1 score of 0.8741 with the Random Forest Classifier.

### Results Visualization
ROC curves, confusion matrices, class prediction errors, learning curves, and feature importance plots were generated. A screenshot from the local run of mlflow for each experiment was provided.

### Resualts
| # | Best model | F1-score |
|:-:|:-:|:-:|
| 1 | Decision Tree Classifier | 0.1323 |
| 2 | Random Forest Classifier | 0.0916 |
| 3 | Random Forest Classifier | 0.3650 |
| 4 | Random Forest Classifier | 0.4996 |
| 5 | Random Forest Classifier | 0.8741 |

