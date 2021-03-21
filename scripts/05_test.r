#run lasso on test data

#rename cell with transformations
tplatelet = test$platelet^0.25
trbc = test$rbc^0.9

lmout2 = lm(wbc ~ log(vitC+1) + upperLeg + sqrt(kcal) + carb + sqrt(ageMonths) + famSize + sqrt(waistCirc) + sqrt(aveStep) +
              houseSize + armCirc + marital + gender + (trbc) + caffeine + (tplatelet) + ethnicity , data = test )

#Lasso

# create matrix versions
x = model.matrix(wbc~ .,test)
y = test$wbc
# -------------- lasso:
lasso.mod = glmnet(x, y, alpha = 1)
cv.out = cv.glmnet(x, y, alpha = 1)
bestlam = cv.out$lambda.1se
lasso.coef = predict(cv.out, type = "coefficients", s = bestlam)[1:17, ]
lasso.coef[lasso.coef != 0]

#Results for Lasso
#(Intercept) 
#6.977778 


#Backwards Elimination

lmout2 = lm(wbc ~ sqrt(ageMonths) + sqrt(waistCirc)
            + armCirc + (tplatelet) + upperLeg:sqrt(waistCirc)
            , data = test )

summary(lmout2)

#Backwards Elimination results for train data

lmout2 = lm(wbc ~ sqrt(ageMonths) + sqrt(waistCirc)
            + armCirc + (tplatelet) + upperLeg:sqrt(waistCirc), data = train )

summary(lmout2)
anova(lmout2)


#Backwards Elimination validation for test set

lmout2 = lm(wbc ~ sqrt(ageMonths) + sqrt(waistCirc)
            + armCirc + (tplatelet) + upperLeg:sqrt(waistCirc), data = test )

summary(lmout2)
anova(lmout2)
