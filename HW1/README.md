# **HW1**
**Utilize a dataset on electricity consumption and train a regression model to forecast future consumption.**
1. hw1 contains Support Vector Regressor (SVR) model has been created and trained to predict electricity consumption based on the parameters 'month,' 'day of the week,' 'hour,' 'minute,' 'voltage,' and 'global intensity. Get MSE = 46.566 and r2 score = 0.491.
2. hw1_1 constain the same algorithm, but among the input data, includes 'Global_active_power' and 'sub_metering_1, 2, 3,' which were used to compute the target variable Y according to a specific formula. The resulting MSE value is 0.0033, and the r2 score is 0.9999.
   
The target variable \( Y \) is calculated using the formula:

\[ Y = \frac{{\text{{global\_active\_power}} \times 1000}}{{60}} - \text{{sub\_metering\_1}} - \text{{sub\_metering\_2}} - \text{{sub\_metering\_3}} \]