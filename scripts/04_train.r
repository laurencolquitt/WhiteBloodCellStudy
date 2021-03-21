#read in packages
library(glmnet)
library(leaps)

#read in dataset
tcell = read.csv("whiteBloodCellDataset.csv", header = TRUE)

#Set test and train data

#Take out outliers for test/train data
tcell = tcell[-87,]
tcell = tcell[-288,]
tcell = tcell[-483,]

#Take out ID predictor

tcell = tcell[-1]

#rename cell with transformations
tplatelet = train$platelet^0.25
trbc = train$rbc^0.9

lmout2 = lm(wbc ~ log(vitC+1) + upperLeg + sqrt(kcal) + carb + sqrt(ageMonths) + famSize + sqrt(waistCirc) + sqrt(aveStep) +
             houseSize + armCirc + marital + gender + (trbc) + caffeine + (tplatelet) + ethnicity , data = train )

pairs(tcell)

#separating data into training set and test set

itest = rbinom(nrow(tcell), 1, prob=.1)
test = tcell[itest==1,]
train = tcell[itest==0,]

#Lasso

# create matrix versions
x = model.matrix(wbc~ .,train)
y = train$wbc
# -------------- lasso:
lasso.mod = glmnet(x, y, alpha = 1)
cv.out = cv.glmnet(x, y, alpha = 1)
bestlam = cv.out$lambda.1se
lasso.coef = predict(cv.out, type = "coefficients", s = bestlam)[1:17, ]
lasso.coef[lasso.coef != 0]

#Results for Lasso

#(Intercept)      upperLeg     ageMonths     waistCirc       aveStep      platelet 
#5.875780e+00 -1.378556e-02 -6.883636e-04  5.218635e-03 -2.258414e-05  6.650432e-03 

lmout3 = lm(wbc ~ upperLeg + ageMonths + waistCirc + aveStep + platelet, data = tcell)
pairs(lmout3)

#Backwards Elimination

lmout2 = lm(wbc ~ log(vitC+1) + upperLeg + sqrt(kcal) + carb + sqrt(ageMonths) + famSize + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + marital + gender + (trbc) + caffeine + (tplatelet) + ethnicity + upperLeg:sqrt(waistCirc) + houseSize:famSize
            + trbc:tplatelet + carb:sqrt(kcal), data = train )

summary(lmout2)

#Gender is dropped because its pvalue is 0.851849 which is greater than 0.05 so its not significant.

lmout2 = lm(wbc ~ log(vitC+1) + upperLeg + sqrt(kcal) + carb + sqrt(ageMonths) + famSize + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + marital + (trbc) + caffeine + (tplatelet) + ethnicity + upperLeg:sqrt(waistCirc) + houseSize:famSize
            + trbc:tplatelet + carb:sqrt(kcal), data = train )

summary(lmout2)

#Caffeine is dropped because its pvalue is 0.699911 which is not significant.

lmout2 = lm(wbc ~ log(vitC+1) + upperLeg + sqrt(kcal) + carb + sqrt(ageMonths) + famSize + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + marital + (trbc) + (tplatelet) + ethnicity + upperLeg:sqrt(waistCirc) + houseSize:famSize
            + trbc:tplatelet + carb:sqrt(kcal), data = train )

summary(lmout2)

#Marital is dropped because its pvalue is 0.68500 which is not significant.

lmout2 = lm(wbc ~ log(vitC+1) + upperLeg + sqrt(kcal) + carb + sqrt(ageMonths) + famSize + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + (trbc) + (tplatelet) + ethnicity + upperLeg:sqrt(waistCirc) + houseSize:famSize
            + trbc:tplatelet + carb:sqrt(kcal), data = train )

summary(lmout2) 

#trbc:tplatelet is dropped because its pvalue is 0.5830 which is not significant.

lmout2 = lm(wbc ~ log(vitC+1) + upperLeg + sqrt(kcal) + carb + sqrt(ageMonths) + famSize + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + (trbc) + (tplatelet) + ethnicity + upperLeg:sqrt(waistCirc) + houseSize:famSize
               + carb:sqrt(kcal), data = train )

summary(lmout2)

#sqrt(kcal):carb is dropped because pvalue is 0.54855 and is not significant.

lmout2 = lm(wbc ~ log(vitC+1) + upperLeg + sqrt(kcal) + carb + sqrt(ageMonths) + famSize + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + (trbc) + (tplatelet) + ethnicity + upperLeg:sqrt(waistCirc) + houseSize:famSize
             , data = train )

summary(lmout2)

#Trbc pvalue is 0.67527 and is not significant.

lmout2 = lm(wbc ~ log(vitC+1) + upperLeg + sqrt(kcal) + carb + sqrt(ageMonths) + famSize + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + (tplatelet) + ethnicity + upperLeg:sqrt(waistCirc) + houseSize:famSize
            , data = train )

summary(lmout2)

#Family Size pvalue is 0.44909 and is not significant.

lmout2 = lm(wbc ~ log(vitC+1) + upperLeg + sqrt(kcal) + carb + sqrt(ageMonths) + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + (tplatelet) + ethnicity + upperLeg:sqrt(waistCirc) + houseSize:famSize
            , data = train )

summary(lmout2)

#Upper Leg's pvalue is 0.42292 which isn't significant

lmout2 = lm(wbc ~ log(vitC+1) + sqrt(kcal) + carb + sqrt(ageMonths) + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + (tplatelet) + ethnicity + upperLeg:sqrt(waistCirc) + houseSize:famSize
            , data = train )

summary(lmout2)

#log(vitC+1)'s pvalue is 0.352057 is not significant

lmout2 = lm(wbc ~ sqrt(kcal) + carb + sqrt(ageMonths) + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + (tplatelet) + ethnicity + upperLeg:sqrt(waistCirc) + houseSize:famSize
            , data = train )

summary(lmout2)

#Ethnicity's pvalue is 0.270848

lmout2 = lm(wbc ~ sqrt(kcal) + carb + sqrt(ageMonths) + sqrt(waistCirc) + sqrt(aveStep) + houseSize
               + armCirc + (tplatelet) + upperLeg:sqrt(waistCirc) + houseSize:famSize
            , data = train )

summary(lmout2)

#House Size's pvalue is 0.354932

lmout2 = lm(wbc ~ sqrt(kcal) + carb + sqrt(ageMonths) + sqrt(waistCirc) + sqrt(aveStep)
            + armCirc + (tplatelet) + upperLeg:sqrt(waistCirc) + houseSize:famSize
            , data = train )

summary(lmout2)

#sqrt(kcal)'s pvalue is 0.200711

lmout2 = lm(wbc ~ carb + sqrt(ageMonths) + sqrt(waistCirc) + sqrt(aveStep)
            + armCirc + (tplatelet) + upperLeg:sqrt(waistCirc) + houseSize:famSize
            , data = train )

summary(lmout2)

#carb's pvalue is 0.149089

lmout2 = lm(wbc ~ sqrt(ageMonths) + sqrt(waistCirc) + sqrt(aveStep)
            + armCirc + (tplatelet) + upperLeg:sqrt(waistCirc) + houseSize:famSize
            , data = train )

summary(lmout2)

#houseSize:famSize pvalue is 0.067765

lmout2 = lm(wbc ~ sqrt(ageMonths) + sqrt(waistCirc) + sqrt(aveStep)
            + armCirc + (tplatelet) + upperLeg:sqrt(waistCirc)
            , data = train )

summary(lmout2)

#sqrt(aveStep) pvalue is 0.051986

lmout2 = lm(wbc ~ sqrt(ageMonths) + sqrt(waistCirc)
            + armCirc + (tplatelet) + upperLeg:sqrt(waistCirc)
            , data = train )

summary(lmout2)

# the only difference between Lasso and Backwards Elimination 
# is that lasso had upper leg and average step versus backwards having
# the interaction of sqrt(waistCirc):upperLeg and arm circumference

