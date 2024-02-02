# **HW1**
## **Utilize a dataset on electricity consumption and train a regression model to forecast future consumption.**

### [**Data set**](https://www.kaggle.com/datasets/fedesoriano/electric-power-consumption/data)

### [**Code**](HW1.ipynb)

### Data Preprocessing
 The obtained .csv file contains columns such as Datetime, Temperature, Humidity, WindSpeed, GeneralDiffuseFlows, DiffuseFlows, PowerConsumption_Zone1, PowerConsumption_Zone2, PowerConsumption_Zone3. The average value was calculated across all three zones. A small window with a 10-minute interval was transformed into a window with a 1-hour interval, and the average values for each hour were calculated. Additionally, Datetime was split into columns 'Hour', 'Day', 'Month' as numerical features for training a regression model. The data were normolized & divided into test and train samples for model training and performance evaluation.

### Data Visualization 
 Histograms depicting the distribution of each feature were generated. Also power consumption graphics. Also, a graph illustrating the changes in power consumption over time was created.

### Regression Model Training
 Several regression models were trained, including SVR, LinearRegression, LassoRegression, RandomForestRegressor, GradientBoostingRegressor, AdaBoostRegressor, and DecisionTreeRegressor. Metrics such as MSE and r2-score were computed for each model. The best-performing models were GradientBoostingRegressor (r2-score = 0.96) and DecisionTreeRegressor (r2-score = 0.92). The complete table of metrics:

| Model | MSE | R2-score |
|-------------|-------------|-------------|
| SVR    | $1.54*10^{7}$    | 0.52    |
| LinearRegression    | $1.19*10^{7}$    | 0.63    |
| LassoRegression    | $1.19*10^{7}$    | 0.63    |
| RandomForestRegressor | $4.30*10^{6}$ | 0.86 |
| GradientBoostingRegressor | $1.39*10^{6}$ | 0.96 |
| AdaBoostRegressor | $4.69*10^{6}$ | 0.85 |
| DecisionTreeRegressor | $2.58*10^{6}$ | 0.92 |

Feature importances for best model (GradientBoostingRegressor) are:
1. Temperature importances = 0.176;
2. Humidity importances = 0.003;
3. WindSpeed importances = 0.013;
4. GeneralDiffuseFlows importances = 0.021;
5. DiffuseFlows importances = 0.005;
6. Hour importances = 0.697;
7. Day importances = 0.009;
8. Month importances = 0.076.
