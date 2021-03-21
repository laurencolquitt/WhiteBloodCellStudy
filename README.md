
# White Blood Cell Statistical Study

## Background

The nature of the dataset is biological data from the National Health and Nutrition Examination Survey (NHANES), which is conducted by the National Center for Health and Statistics (NCHS). The background of the data comes from hundreds of observations from demographical, physical and dietary measurements from subjects in the United States.

White blood cells are the cells of the immune system involved in protecting the body from infection and disease. Knowing the amount of blood cells a person has might prove useful in predicting whether the person is a more vulnerable subject of disease. This could prove useful in providing insight to new health policy and what aspects might be the best focus of policy resources.

Knowing the factors that influence white blood cells will not only prove beneficial in determining who is vulnerable, but can also prove useful in helping doctors apply correct treatment to patients with a low count by focusing on the most relevant variables.

The dataset contains 18 variables and 500 observations which should provide a great base to conduct statistical analysis with robust results.

## Methods

Prior to data interpretation and modifications to assumptions, Lasso was run with no variable transformations. The results identified only one insignificant variable, ageMonths. To access improvements post data cleansing, Backwards Elimination performed on the original variables as a comparison to the final variables in this analysis.

The first approach used to build the model was to check assumptions. Such simple linear regression assumptions were compiled by graphing scatterplots, standardized residuals, normal probability plot of residuals, leverage plot, and Cooks'D plot of each predictor against defined response variable, white blood cells count. Following, multiple linear regression assumptions were compiled by graphing pairs plot, plot of y versus each numeric x, standardized residuals versus each predictor variable, standardized residuals versus fitted values, marginal model plots, added variable plots. Note: The plot of y versus each numeric x along with the standardized residuals versus each predictor variable were already given in the simple linear regression assumptions and therefore, not repeated.

The simple linear assumptions were checked for each predictor variable plot. Outliers and bad leverage points were removed from the underlying data to avoid the potential of skewed results in the final model and test validation. Adjusting for the heteroscedasticity and nonlinearity between the variables, after the multiple linear regression models showed skewed results. The transformations to adjust scatterplots, Q-Q plots, and standardized residuals plots included: log, square root, and different values of lambda.

After assumptions for each predictor fixed, variables with statistical significance were determined. The approach was to first parse the data into 90% of records to be set as the train data and remaining 10% to be test data for future interpretations and validation of the final model predictions.

A Lasso regression analysis was performed on the fixed dataset for the result to be used in comparison to other forms of variable selection. Backwards Elimination was used to eliminate variables with insignificant p-values of which were not contributing to the ultimate goal of variable prediction within the model. Consideration of confounding variables was taken into account during the Backwards Elimination process. Leveraging the training data, the Backwards Elimination model selection proved more significant to the Lasso analysis with the R^2 of 0.173 compared to 0.153, respectively. The validation check using the test data showed greater correlation than the test data as the R^2 was higher and a lower RSS. This shows the final model is a reasonable predictor of future behavior as the model could be used on future data results.

Size differences between the test and train data sets seem to have caused oddities in results. If the train data contained more observations, it should have higher correlation than the test data set, but this did not hold true with the insufficient amount of data observations (<500). The variables portrayed in the Backwards Elimination were the best fit for our data although it was very similar to our results of the Lasso test. Now using the determined significant variables from the final model, a pairs plot was created showing better representation. The variables used included: age in months, waist circumference, arm circumference, number of platelets, and the interaction between upper leg and waist circumference.
## Results

The final model procured using Backwards Elimination for variable selection resulted in using the following variables: age in months, waist circumference, arm circumference, number of platelets, and the interaction between upper leg and waist circumference.

The coefficients are listed here:

·      Intercept: -26.561005

·      Square Root of Age in Months: -0.002967

·      Square Root of Waist Circumference: 1.769488

·      Arm Circumference: -0.228224

·      Number of Platelets ^ 0.9: 4.782211

·      Interaction of Square Root of Waist Circumference and Upper Leg: 0.013183

Lasso regression analysis was used as a point of comparison to Backwards Elimination. The only difference between the two was Lasso resulting in upper leg and average step opposed to Backwards Elimination having the interaction of sqrt(waistCirc) to upperLeg, and arm circumference. When the Lasso model was used on the test data, none of the predictors were present in the model, therefore the Backwards Elimination model was chosen which also had an improved R^2 and RSS.

### Summary of Backwards Elimination Model:

| Coefficients:            | Estimate Std. | Error    | t value | Pr(>\|t\|) | Significance |
|--------------------------|---------------|----------|---------|------------|--------------|
| (Intercept)              | -7.014002     | 2.220838 | -3.158  | 0.0017     | **           |
| sqrt(ageMonths)          | -0.110311     | 0.021684 | -5.087  | 5.43E-07   | ***          |
| sqrt(waistCirc)          | 1.406877      | 0.235646 | 5.97    | 4.95E-09   | ***          |
| armCirc                  | -0.132943     | 0.033418 | -3.978  | 8.14E-05   | ***          |
| tplatelet                | 2.343705      | 0.383327 | 6.114   | 2.17E-09   | ***          |
| sqrt(waistCirc):upperLeg | -0.005597     | 0.002505 | -2.235  | 0.026      | *            |

---

Signif. codes:  0 ***, 0.001 **, 0.01 *

Residual standard error: 1.865 on 432 degrees of freedom

Multiple R-squared: 0.1732, Adjusted R-squared: 0.1636

F-statistic: 18.1 on 5 and 432 DF, p-value: 2.599e-16

Analysis of Variance Table:
| Response: wbc            | Df  | Sum Sq  | Mean Sq | F value | Pr(>F)   | Significance |
|--------------------------|-----|---------|---------|---------|----------|--------------|
| sqrt(ageMonths)          | 1   | 47.29   | 47.293  | 13.5928 | 0.000256 | ***          |
| sqrt(waistCirc)          | 1   | 22.78   | 22.785  | 6.5487  | 0.010836 | *            |
| armCirc                  | 1   | 70.63   | 70.63   | 20.3003 | 8.53E-06 | ***          |
| tplatelet                | 1   | 156.73  | 156.733 | 45.0475 | 6.06E-11 | ***          |
| sqrt(waistCirc):upperLeg | 1   | 17.37   | 17.373  | 4.9933  | 0.025956 | *            |
| Residuals                | 432 | 1503.05 | 3.479   |         |          |              |

### Summary of Lasso Model:

| Coefficients:            | Estimate Std. | Error      | t value | Pr(>\|t\|) | Significance |
|--------------------------|---------------|------------|---------|------------|--------------|
| (Intercept)              | -4.517465     |   9.376536 |  -0.482 |   0.6327   | **           |
| sqrt(ageMonths)          | -0.132436     |   0.091759 |  -1.443 |   0.1569   | ***          |
| sqrt(waistCirc)          | 0.628295      |   1.005510 |   0.625 |   0.5357   | ***          |
| armCirc                  | -0.134952     |   0.117584 |  -1.148 |   0.2581   | ***          |
| tplatelet                | 2.733341      |   1.610658 |   1.697 |   0.0977   | ***          |
| sqrt(waistCirc):upperLeg | 0.004001      |   0.011218 |   0.357 |   0.7233   | *            |

### Summary of Validation Check Produced by Backwards Elimination:

| Coefficients:            | Estimate Std. | Error    | t value | Pr(>\|t\|) | Significance |
|--------------------------|---------------|----------|---------|------------|--------------|
| (Intercept)              | -26.561005    | 6.835808 | -3.886  | 0.000356   | ***          |
| sqrt(ageMonths)          | 0.002967      | 0.06976  | 0.043   | 0.966271   |              |
| sqrt(waistCirc)          | 1.769488      | 0.682373 | 2.593   | 0.013034   | *            |
| armCirc                  | -0.228224     | 0.100753 | -2.265  | 0.028721   | *            |
| tplatelet                | 4.782211      | 1.191852 | 4.012   | 0.000242   | ***          |
| sqrt(waistCirc):upperLeg | 0.013183      | 0.009379 | 1.406   | 0.167219   |              |

---

Residual standard error: 2.042 on 42 degrees of freedom

Multiple R-squared: 0.4058, Adjusted R-squared: 0.3351

F-statistic: 5.737 on 5 and 42 DF, p-value: 0.0004026

## Conclusion

The model determined through backwards elimination regression analysis is as follows:

White blood cell count(1000 cells per ul) = -7.014002 – 0.110311(sqrt(ageMonths), months) + 1.406877(sqrt(waistCirc), centimeters) – 0.132943(armCirc, centimeters) + 2.343705(tplatelet, 1000 cells per ml) – 0.005597(sqrt(waistCirc):upperLeg, centimeters).

Therefore, the model predicts for every increase in 1,000 cells per ul, white blood cell count will in fact decrease by 7.014002, and an increase of the square root of age in month predicts a decrease by 0.110311, for every centimeter increase in waist circumference it is predicted to increase by 1.406877, and a centimeter increase of arm circumference a decrease by 0.132943, and every 1000 cell ul. increase in platelets, white blood cell counts will increase by 2.343705, and lastly, every upper leg centimeter increase a white blood cell count will decrease by 0.005597.

The Lasso model produced an R^2 value of 0.153 and 1682.72 RSS. The low R^2 value indicates the  model does not show a strong correlation between the remaining predictors and the response variable. The Backwards Elimination produced an R^2 value of 0.1734 and the residual sum of squares of 1507.90 being lower than the Lasso outcome.
The final model produced by Backwards Elimination was preferred as more of the variance in the exploratory variables is explained by the response and the errors are smaller.

The validation for the Backwards Elimination using the test data produced an R^2 value of 0.4058 and a residual sum of squares of 175.106, which indicates the model was helpful in predicting the response variables. Overall the metrics can be interpreted as a reasonable predictor of white blood cell counts. 

If decided a follow-up study was necessary, the model would be modified to reduce certain categorical variables for efficiency. Removing such categorical variables like gender, marital status, house size, family size, and caffeine favored a more conclusive model. When testing for assumptions these variables provided very little information and inconsistent graphs with no correlation to white blood cell count.

Additional variables like vitamin counts of zinc, folic acid, iron content, and protein intake have the potential for benefiting the model predictability and should be considered in future development. Iron content would have been interesting to access the influence of red blood cell count as corrected with white blood cell amounts.

Ultimately, the dataset of only 500 observations posed an inadequate foundation for this analysis. Possibly with higher volume, the outliers found may have been less influential, and overall the model could have been easier to fit. Especially, with many different variables that seem to not pertain to any significant impact on white blood cell counts.

For the interpretation of the model, the p-value for the remaining variables can not be interpreted as the predictors were set and subsequently altered the original data. Therefore, interpretation of the original model can not  be determined as it has been tampered with. 

The disadvantages of a Backwards Elimination based model is the initial model can be unstable caused by multicollinearity resulting in a variable to be a linear combination of one or more other variables. Multicollinearity causes an adverse impact as removing a variable could possibly decrease the significance of another variable which was previously determined to be significant due to this linear dependency. The only significant variable with this inherent interaction is the square root of waist circumference with upper leg length. On the other hand, the Lasso method maintains stability when choosing predictors as it keeps lower variance by shrinking insignificant variables down to 0. 

## Variable Assumptions

### Vitamin C

The vitamin C to white blood cell count scatterplot has no sign of linearity in the model, but this could be skewed due to the outliers/leverage points that are way outside the cluster of the majority of the data and the fact that there are a lot of individuals with 0mg of vitamin c in their diet in the first day. From the scatterplot there are appears to be at least 4 outliers above the mass of the data, and 2 outliers expanding the scale for vitamin c. The 4 outliers are more likely to be leverage points since they have a greater change in Y value than the 2 outliers to the side since they have about the same white blood cell count compared to the majority of the data. The standardized residuals plot is exactly the same as the scatter plot. The variability is random and the standardized residuals are homoscedastic. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are 6-7 obvious points that are outside the boundary -2 to 2 , but there are 4-6 other points that are outside the range but not as much. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is long tailed with the bottom portion barely short tailed. These outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot. The leverage plot shows that there are no leverage points in the data since all points are below the 2(p+1)/n line, so there are no leverage points. The Cooks&#39;D plot shows 10 very large points of influence and 20 other points that are less influential, but all are influential since they are greater than the 4/(n-p-1) boundary.

<img src="https://user-images.githubusercontent.com/81055664/111916146-20a21d00-8a3f-11eb-9195-918818a9ba54.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111916147-20a21d00-8a3f-11eb-844c-d5505ac1799e.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111916142-20098680-8a3f-11eb-9601-ca4c89af5df5.jpeg" width=30%/>
<img src="https://user-images.githubusercontent.com/81055664/111916138-1ed85980-8a3f-11eb-9550-4fe24725a4a4.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111916139-1f70f000-8a3f-11eb-8f1b-16796de307e1.jpeg" width=30%/>


### Upper Leg

The upper leg length to white blood cell count scatterplot has barely a negative correlation of a sign of linearity in the model. From the scatterplot there appears to be 6 outliers above the mass of the data. The standardized residuals plot show that the variability is random and the standardized residuals are homoscedastic except for where the outliers/leverage points are that increase the variability in standardized residuals. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are 6 obvious points that are outside the interval -2 to 2 , but there are about 10 other points that are barely outside the range, so they should be kept till you look at the other model without the other extreme points. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is long left tailed and the bottom corner is short tailed, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot. The leverage plot shows that there are no leverage points in the data since all points are below the 2(p+1)/n line, so there are no leverage points. The Cooks&#39;D plot shows 10 very large points of influence and 10 other points that are less influential, but they are still influential since they are greater than the 4/(n-p-1) boundary.

<img src="https://user-images.githubusercontent.com/81055664/111917206-539adf80-8a44-11eb-82c0-eaddb8481060.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111917207-54337600-8a44-11eb-9a09-6bd716c5e3a9.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111917203-53024900-8a44-11eb-8195-7b7ebf0c1c4a.jpeg" width=30%/>
<img src="https://user-images.githubusercontent.com/81055664/111917202-5269b280-8a44-11eb-9ae2-dae805de43ee.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111917200-51388580-8a44-11eb-89ac-6d4ad78a1a99.jpeg" width=30%/>

### Calories

The scatterplot of calories in the first day versus white blood cell count has no sign of linearity in the model. From the scatterplot there appears to be 4, possibly 5 outliers above the mass of the data, there are outliers 5-7 outliers on the right side of the data that have high amounts of calories but similar levels in white blood cell count, so they follow the data relatively well. The standardized residuals plot show that the variability is random and the standardized residuals are homoscedastic except for where the outliers/leverage points are that increase the variability in standardized residuals. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are 4 obvious points that are outside the boundary -2 to 2 , but there are 4-6 other points that are outside the range but not as much. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is short tailed, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot. The leverage plot shows that there is a possibility of a leverage point in the data since the point is significantly far away from the data. The Cooks&#39;D plot shows 4 very large points of influence and 7-9 other points that are less influential, but they are still influential since they are greater than the 4/(n-p-1) boundary.

<img src="https://user-images.githubusercontent.com/81055664/111917377-40d4da80-8a45-11eb-809d-ce2611a2a070.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111917378-416d7100-8a45-11eb-9dd3-9a4adc33b06f.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111917376-403c4400-8a45-11eb-867b-90824ddc7ebd.jpeg" width=30%/>

### Carbohydrate

The scatter plot shows a slight positive linear association and data that is well spread out throughout the graph. When we look at the residual plot we see good homoscedasticity and no irregular patterns. An indicator again that the data is good and linear. The Q-Q plot does present a bit of a problem because we see now that the data is a bit short-tailed but if we look at the Cook&#39;s D plot we see that there are few outliers and only one that could present a potential problem. The leverage plot shows much of the same, but ultimately, we see that this data is linear, don&#39;t have too many big outliers, and have equal variance.

<img src="https://user-images.githubusercontent.com/81055664/111917464-c3f63080-8a45-11eb-9806-104324dc1bad.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111917470-c9ec1180-8a45-11eb-85d7-9ceebcaba26b.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111917478-d2444c80-8a45-11eb-8d37-36758ba809ab.jpeg" width=30%/>

### Age in Months 

The ageMonths versus WBC scatterplot has no sign of linearity in the model. From the scatterplot there are appears to be 3-4 outliers above the mass of the data. The standardized residuals plot show that the variability is mostly random and the residuals are homoscedastic. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are 5 obvious points that are outside the boundary -2 to 2 , but there are 6 other points that are outside the range but not as much. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is long tailed, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot. The leverage plot shows that there are many leverage points in the data since there are approximately 10 points that are above the 2(p+1)/n line, so there are leverage points. The Cooks&#39;D plot shows 1-2 very large points of influence and 9 other points that are less influential, but all are influential since they are greater than the 4/(n-p-1) boundary.

<img src="https://user-images.githubusercontent.com/81055664/111918730-30742e00-8a4c-11eb-8a0b-1ee2a4857a18.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918733-3407b500-8a4c-11eb-873a-65d49f0714f6.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918734-366a0f00-8a4c-11eb-930d-46d658d56ba3.jpeg" width=30%/>

### Family Size

The variable Family Size does not have a linear relationship. Largely, this is in part because of the nature of said variable and the fact it is a numeric categorical. The residuals show obvious patterns and the Q-Q plot shows that the data is short-tailed. The Cook&#39;s D plot shows that there is at least one problematic outlier, but nothing too extreme. However, the leverage plot tells a different story and shows that many of the points are leverage points. There is also lots of evidence of heteroscedasticity in all the plots, especially the residuals. Overall, this variable is not a good predictor.

<img src="https://user-images.githubusercontent.com/81055664/111918764-51d51a00-8a4c-11eb-9f45-eb9e9b82a9bd.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918766-54d00a80-8a4c-11eb-836a-14a27bcf7530.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918767-57326480-8a4c-11eb-8720-dc082e9bca83.jpeg" width=30%/>

### Waist Circumference

The scatterplot of waist circumference versus white blood cell count has no sign of linearity in the model. From the scatterplot there appears to be 3-7 outliers above the mass of the data. The standardized residuals plot show that the variability is random and the standardized residuals are homoscedastic except for where the outliers/leverage points are that increase the variability in standardized residuals. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are about 9 obvious points that are outside the boundary -2 to 2 , but there are 4-6 other points that are outside the range but not as much. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is short tailed, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot. Leverage plot. The leverage plot shows that there is a possibility of a leverage point in the data since the point is significantly far away from the data. The Cooks&#39;D plot shows 4 very large points of influence and 7-9 other points that are less influential, but they are still influential since they are greater than the 4/(n-p-1) boundary.

<img src="https://user-images.githubusercontent.com/81055664/111918790-6e715200-8a4c-11eb-938f-fa2fd3a2a70b.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918791-703b1580-8a4c-11eb-8166-371051f5e83e.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918795-729d6f80-8a4c-11eb-8830-17a15ec192a2.jpeg" width=30%/>

### Average Steps

The average step versus white blood cell count scatterplot has no sign of linearity in the model, but this could be skewed due to the outliers/leverage points that are way outside the cluster of the majority of the data. The p-value on the slope of the line is .0174 which is significant but not very significant. From the scatterplot there are appears to be at least 4 outliers above the mass of the data, and 2 outliers expanding the scale for average steps. The 4 outliers are more likely to be leverage points since they have a greater change in Y value than the 2 outliers to the side since they have about the same white blood cell count compared to the majority of the data. The standardized residuals plot is exactly the same as the scatter plot. The variability is random and the standardized residuals are homoscedastic. The standardized residuals plot shows that about 15 of the data points are outside the -2 to 2 zone which means they are probably outliers. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is long tailed with the bottom portion barely short tailed. Showing that the data does not have a normal shape, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot. The leverage plot shows that there are a few leverage points in the data since they ae above the (p+1)/n line. The Cooks&#39;D plot shows a few large points of influence and 15 other points that are less influential, but all are influential since they are greater than the 4/(n-p-1) boundary.

<img src="https://user-images.githubusercontent.com/81055664/111918815-877a0300-8a4c-11eb-9133-ae9d653e7e19.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918821-8c3eb700-8a4c-11eb-98b7-48d988bb2690.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918825-8f39a780-8a4c-11eb-9aee-e81930600e48.jpeg" width=30%/>

### House Size 

The house size is categorical. The House size versus WBC scatterplot has no sign of linearity in the model. From the scatterplot there are appears to be 4-6 outliers above the mass of the data. The p-value of .601 shows that house size is not statistically significant. The standardized residuals plot show that the variability is categorical but random and the standardized residuals are homoscedastic for being categorical. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are obvious points that are outside the boundary -2 to 2 , but there are few other points that are outside the range but much. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is short tailed, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot. The leverage plot shows that there are a lot of leverage points in the data since there are a great amounts of points above the 2(p+1)/n line, The Cooks&#39;D plot shows 3 very large points of influence and 13 other points that are less influential, but all are influential since they are greater than the 4/(n-p-1) boundary.

<img src="https://user-images.githubusercontent.com/81055664/111918845-9f518700-8a4c-11eb-86b7-7879882fd3ab.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918847-a11b4a80-8a4c-11eb-82e4-6f10d5db1a2d.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918850-a37da480-8a4c-11eb-8706-406066d2472a.jpeg" width=30%/>

### Arm Circumference

The Arm circumference versus WBC scatterplot has no sign of linearity in the model. From the scatterplot there are appears to be 4 outliers above the mass of the data. The p value of .508 is not statistically significant. The residuals plot show that the variability is random and the standardized residuals are homoscedastic. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are 5 obvious points that are outside the boundary -2 to 2 , but there are 4-6 other points that are outside the range but not as much. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is short tailed, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot. The leverage plot shows that there are a lot leverage points in the data since there are many points above the 2(p+1)/n line. The Cooks&#39;D plot shows 1 very large points of influence and 7 other points that are less influential, but all are influential since they are greater than the 4/(n-p-1) boundary.

<img src="https://user-images.githubusercontent.com/81055664/111918863-b3958400-8a4c-11eb-9d17-919351095255.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918864-b5f7de00-8a4c-11eb-85b3-958d0601a79a.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918865-b7c1a180-8a4c-11eb-83b1-74e0521507f3.jpeg" width=30%/>

### Marital 

WBC versus Marital status has no clear association amongst each other. With a p-value of 0.836 it is clear that this variable is not statistically significant. It is not reasonable to make any assumptions based on this particular data set. The QQ plot shows that the data is long tail on the right and short tail on the left which means this data is not normal. Were the two states of marital status to be compared in side by side boxplots, it is clear that the distributions would be almost identical and that there is no clear difference between people that are married and those that are not in white blood cell count.

<img src="https://user-images.githubusercontent.com/81055664/111918889-d4f67000-8a4c-11eb-8bb3-4dd19069ed58.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918894-d758ca00-8a4c-11eb-9701-7d315150d312.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918902-daec5100-8a4c-11eb-9027-01bb3ccf809a.jpeg" width=30%/>

### Gender 

The WBC vs Gender scatterplot has no sign of linearity in the model. The data from both male and female show that there is no clear sign that there is any difference between males and females. The QQ plot shows that these data are not normal, assumptions should not be made.

<img src="https://user-images.githubusercontent.com/81055664/111918918-f8b9b600-8a4c-11eb-9ce9-3668f8396b3d.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918921-fbb4a680-8a4c-11eb-99a8-9a6e0cef467e.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918923-fd7e6a00-8a4c-11eb-866c-8335f9e853fa.jpeg" width=30%/>

### Red Blood Cell Count 

The Red Blood Cell versus WBC scatterplot has some signs of linearity. From the scatterplot there are appears to be 4 outliers above the mass of the data. The standardized residuals plot show that the variability is random and the standardized residuals are homoscedastic. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are 4 obvious points that are outside the boundary -2 to 2 , but there are 4-6 other points that are outside the range but not as much. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is short tailed, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot. With the outliers removed the normality seems to improve slightly, and most data points reside within the -2 to 2 range on the standardized residual plot.

<img src="https://user-images.githubusercontent.com/81055664/111918936-0a02c280-8a4d-11eb-8fa3-267216186870.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918939-0c651c80-8a4d-11eb-9660-14fdc2b5defd.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918944-0e2ee000-8a4d-11eb-973c-3a97133c8fdd.jpeg" width=30%/>

### Caffeine

The Caffeine versus WBC scatterplot has no sign of linearity in the model. From the scatterplot there are appears to be 4-6 outliers above the mass of the data. The standardized residuals plot show that the variability is random and the standardized residuals are not homoscedastic. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are 4 obvious points that are outside the boundary -2 to 2 , but there are 4-6 other points that are outside the range but not as much. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is short tailed, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot.

<img src="https://user-images.githubusercontent.com/81055664/111918960-20108300-8a4d-11eb-9dfe-04b6155faa9d.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918961-2141b000-8a4d-11eb-8e02-9eefaf6f7253.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918963-230b7380-8a4d-11eb-910d-4ff0397a3ba2.jpeg" width=30%/>

### Platelet

The platelet versus WBC scatterplot has signs of linearity in the model. From the scatterplot, there are appears to be 4-6 outliers above the mass of the data. The standardized residuals plot show that the variability is random and the standardized residuals are homoscedastic. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are 4 obvious points that are outside the boundary -2 to 2 , but there are 4-6 other points that are outside the range but not as much. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is short tailed, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot.

<img src="https://user-images.githubusercontent.com/81055664/111918978-39b1ca80-8a4d-11eb-80d3-4cca6b2fdf73.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918980-3ae2f780-8a4d-11eb-9fe0-37a59017c4d5.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918984-3d455180-8a4d-11eb-888a-ac2ebf7815c2.jpeg" width=30%/>

### Ethnicity

The Ethnicity versus WBC histogram has no sign of linearity in the model. From the Histogram there are appears to be 4-6 outliers above the mass of the data. The standardized residuals plot also shows the extent on the outliers/leverage points in the data because there are at least 4 obvious points that are outside the boundary -2 to 2 , but there are 4-6 other points that are outside the range but not as much. They are potential outlier points because they could easily pull the data to greatly influence it. The normal Q-Q plot shows that majority of data follows the Q-Q line, but the top right corner shows that the data is short tailed, these outstretched points varying from the majority of the data are probably the outliers/leverage points that we saw in the scatterplot.

<img src="https://user-images.githubusercontent.com/81055664/111918992-49c9aa00-8a4d-11eb-82cd-5ce4d8cd2ae6.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918994-4f26f480-8a4d-11eb-859d-03b552582198.jpeg" width=30%/><img src="https://user-images.githubusercontent.com/81055664/111918996-50f0b800-8a4d-11eb-803e-c5364a544ad0.jpeg" width=30%/>

### Marginal Model

Looking at marginal model plots it is important to realize that not all variables work with this type of plot. Categorical variables and discrete variables such as family size, house size, marital status, gender, and ethnicity should not have inference drawn upon them using these types of plots.

The plots that have marginal lines that are very close to a linear model are vitamin C, upper leg, kcal, carbs, age in months and arm circumference. Since the linear model and marginal models are nearly identical, we can assume that linear models are appropriate models for these variables.

Plots that don&#39;t have close linear and marginal models are waist circumference, average steps, red blood cells, caffeine, and platelets. These models have grossly different different marginal and linear models. Some of these could be fixed by removing outliers and leverage points. Platelet in particular has a large outlier and leverage point that would probably create a more similar marginal model if it were removed.

When using these conclusions we should note that if linear and marginal plots are different, using linear regression might not be appropriate.

<img width="564" alt="marginalModel" src="https://user-images.githubusercontent.com/81055664/111919804-6bc52b80-8a51-11eb-96cb-83ec422e4172.png">

### Added Variable

Partial regression plots are related to, but distinct from, partial residual plots. Partial regression plots are most commonly used to identify data points with high leverage and influential data points that might not have high leverage.  This helps find the points that plots and test might not be able to easily detect and eliminate them for the data to get better fits.  In the plots we can see clear differences between variables, where the plot of marital vs other is two clumps of data, the the data for age in months is a smooth line. We see cases of clumps in data that is not necessarily continuous and this type of data might be better analyzed with other methods. For example, the ethnicity vs other could be better analyzed with another type of plot such as bar chart.

<img width="570" alt="addedVariables1" src="https://user-images.githubusercontent.com/81055664/111919902-cbbbd200-8a51-11eb-9e15-37f83268b358.png">
<img width="635" alt="addedVariables2" src="https://user-images.githubusercontent.com/81055664/111919907-ceb6c280-8a51-11eb-86dc-6839792cd9cb.png">

### Standardized Residuals vs Fitted Values Assumptions

Looking at Standardized Residuals versus Fitted Values is important to realize if our model is a good fit to the data as we are trying minimize the error and have the points as close to the 0 line as possible. If the points are above the line the model overestimated the value and if it&#39;s below the model has undervalued them. We can see that there is a cluster in the middle, slightly to the left and it seems to be that there are more points above the line than below.  The standardized residuals for the most part are heteroscadestic.This information can help researchers tweak their model and make a better fit of data.

<img src="https://user-images.githubusercontent.com/81055664/111919432-98784380-8a4f-11eb-9a84-b3afa61f91aa.png" width=30%/>

<img width="564" alt="fittedResiduals" src="https://user-images.githubusercontent.com/81055664/111919929-e1c99280-8a51-11eb-8431-348d3182c693.png">

### Pairs Plot

Looking at the Pairs Plot, it is easy to see which of the variables are categorical because they have straight lines running horizontal or vertical. Also, there are many of the plots that have points that look like outliers, or influential points. Many of the graphs are homoscedastic. There are large clusters of data in majority of the graphs; many of these variables were transformed over the course of the project. Variables such as kcal, and carb have a positive correlation, with graphs that look very linear.

<img src="https://user-images.githubusercontent.com/81055664/111919140-0885ca00-8a4e-11eb-8b7d-7c42cc268f63.jpeg" width=50%/>

## Transformations


### Adjusting Assumptions

Before we tested our assumptions we originally decided to omit outliers immediately. We found three outliers that we chose to remove to better the model. We removed observations 87, 288, and 483. After this we decided to test our original assumptions, when we did this we noted that there were some variables that we should transform to create a stronger, more linear model. The transformations we did included a log of vitamin C, a square root of kcal, a square root of age in months, a square root of waist circumference, a square root of average daily steps, rbc^.9, and platelet^.25. We found that by transforming these variables, their plots in general looked more linear, had better homoscedasticity, and less influential points after removing outliers and doing transformations.

<img src="https://user-images.githubusercontent.com/81055664/111919304-f22c3e00-8a4e-11eb-9a23-01df899d821f.jpeg" width=60%/>
<img src="https://user-images.githubusercontent.com/81055664/111919322-0d974900-8a4f-11eb-9cd8-583bb52137c4.jpeg" width=60%/>
<img src="https://user-images.githubusercontent.com/81055664/111919338-1f78ec00-8a4f-11eb-8196-92f42c073af5.jpeg" width=60%/>


### Red Blood Cell Transformations

When transforming the variable Red Blood Cells, there were vary subtle changes from 0.1-0.9. While there was no apparent change in Cook's D, and standardized residuals, the biggest change was found in the QQ plots where Lambda of 0.9 showed the most favorable modification.
