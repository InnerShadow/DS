# **HW1**
## **Utilize a dataset on electricity consumption and train a regression model to forecast future consumption.**

[Data set](https://www.kaggle.com/datasets/fedesoriano/electric-power-consumption/data)

### Data Preprocessing:
 The obtained .csv file contains columns such as Datetime, Temperature, Humidity, WindSpeed, GeneralDiffuseFlows, DiffuseFlows, PowerConsumption_Zone1, PowerConsumption_Zone2, PowerConsumption_Zone3. The mean value across all three zones was calculated. A small window with a 10-minute interval was transformed into a window with a 1-hour interval, and the average values for each hour were obtained. Additionally, Datetime was split into columns 'Hour,' 'Day,' 'Month' as numerical features for regression model training. The data was split into test and train sets for model training and performance evaluation.

### Data Visualization 
Histograms depicting the distribution of each feature were constructed.


### Regression Model Training
 Several regression models were trained, including SVR, LinearRegression, LassoRegression, RandomForestRegressor, GradientBoostingRegressor, AdaBoostRegressor, DecisionTreeRegressor. Metrics such as MSE and r2-score were computed for each model. The best-performing models were GradientBoostingRegressor (r2-score = 0.95) and DecisionTreeRegressor (r2-score = 0.91). The complete table of metrics is as follows:

| Model | MSE | R2-score |
|-------------|-------------|-------------|
| SVR    | $1.53*10^{7}$    | 0.52    |
| LinearRegression    | $1.55*10^{7}$    | 0.63    |
| LassoRegression    | $1.19*10^{7}$    | 0.63    |
| RandomForestRegressor | $4.30*10^{6}$ | 0.86 |
| GradientBoostingRegressor | $1.39*10^{6}$ | 0.96 |
| AdaBoostRegressor | $4.69*10^{6}$ | 0.85 |
| DecisionTreeRegressor | $2.58*10^{6}$ | 0.92 |