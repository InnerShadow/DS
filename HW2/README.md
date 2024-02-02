# **HW2**
## **1. Perform hierarchical clustering and DBSCAN using the example of a dataset on the distribution of penguins by type.**

### [**Data set**](https://www.kaggle.com/datasets/youssefaboelwafa/clustering-penguins-species)

### [**Code**](Clustering.ipynb)

### Data Preprocessing
 A dataset with penguin characteristics was selected, including culmen_length_mm, culmen_depth_mm, flipper_length_mm, body_mass_g, and sex. The data contained some missing values, 2 for each feature except for sex, where 9 values were missing. Missing data were removed from the dataset. The categorical feature sex was then encoded with values (0, 1), where 0 represents female and 1 represents male. Descriptive statistics revealed that the flipper_length_mm column contained incorrect values, such as -132 mm or 5000 mm; these records were also removed. The data were normalized, and Principal Component Analysis (PCA) was applied to reduce feature space.

### Data Visualization 
 Histograms depicting the distribution of each parameter and box plots were generated.

### Clustering Models
 1. DBSCAN model was trained. DBSCAN identifies clusters of arbitrary shapes and automatically determines their number. It is based on the epsilon neighborhood of a point (U(x) = {u in U: ro(x, u) <= epsilon}). Three types of objects are identified: core, boundary, and noise. A random object is chosen, and its epsilon neighborhood is examined. If it contains fewer than m other objects, it is marked as potential noise (if not assigned to any cluster, it remains noise). The process is repeated recursively. After the algorithm, clusters and noise points are obtained. The number of clusters is automatically determined from specified parameters. Parameters chosen were: epsilon = 1 and the minimum number of objects to form a core cluster = 5. Metrics were collected. DBSCAN detected 4 clusters and 2 outliers. A graph was plotted with principal components on the axes, and clusters were differentiated by color.
 2. Hierarchical clustering was attempted. Objects were initialized as individual clusters, and neighboring objects were successively merged. Agglomeration, using the Lance-Williams formula, described the distance between clusters during agglomeration. The hierarchical clustering algorithm requires the number of clusters as a hyperparameter. Since DBSCAN showed 4 clusters, AgglomerativeClustering was set to 4 clusters. A graph was plotted with principal components on the axes, and different clusters were differentiated by color. A dendrogram illustrating the merging process into clusters was also created. Metrics were collected.

### Metrics
 1. Silhouette Score: Evaluates how similar objects within clusters are and how different objects in different clusters are. Scores range from -1 to 1, with higher values indicating denser and more distinct clusters.
 2. Homogeneity, Completeness, V-measure: Used for multi-class clustering. Homogeneity measures how much each cluster consists of objects from one class, Completeness measures how well all objects of one class belong to one cluster, and V-measure is their harmonic mean.
 3. Calinski-Harabasz Index: Measures the ratio of variance within clusters to variance between clusters. A higher index value usually indicates better clustering.

Based on the metrics, hierarchical clustering seems to have performed better. The measurement table is presented below.

| Model | Silhouette Score | Homogeneity | Completeness | V-measure | Calinski-Harabasz Index |
|-----|--------|-------------|-|-|--|
| DBSCAN    | 0.49    | 0.24    | 0.99 | 0.38 | 278.77 |
| AgglomerativeClustering    | 0.51    | 0.23    | 0.99 | 0.38 | 363.97 |