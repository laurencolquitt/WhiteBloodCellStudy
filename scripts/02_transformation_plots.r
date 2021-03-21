#Testing transformations
#Lambda=0.25 of VitC versus WBC###########################

#include the origin on the plot
myxlims = c(0, max((cell$vitC^0.25)))
myylims = c(0, max(cell$wbc))

#Axis labels and titles
plot((cell$vitC^0.25), (cell$wbc),
     xlim = myxlims,
     ylim = myylims,
     xlab = "(Vitamin C (mg) in first day observed diet)^0.25", 
     ylab = "White Blood Cell Count (1000 cells/ul)",
     main = "WBC versus (Vitamin C)^0.25 ")

#Fit a regression line
lmout = lm(wbc ~ (vitC)^0.25, data = cell)

#Add regression line to the plot
abline(lmout)

#see what the values are on the table
summary(lmout)

#Log of vitC###########################

#include the origin on the plot
myxlims = c(0, max(log(cell$vitC+1)))
myylims = c(0, max(cell$wbc))

#Axis labels and titles
plot(log(cell$vitC+1), (cell$wbc),
     xlim = myxlims,
     ylim = myylims,
     xlab = "log (Vitamin C (mg) in first day observed diet)", 
     ylab = "White Blood Cell Count (1000 cells/ul)",
     main = "WBC versus log of Vitamin C ")

#Fit a regression line
lmout = lm(wbc ~ log(vitC+1), data = cell)

#Add regression line to the plot
abline(lmout)

#see what the values are on the table
summary(lmout)

#Log Residuals Plot
plot(log(cell$vitC+1), lmout$res,
     xlab = "log(Vitamin C (mg) in first day observed diet)",
     ylab = "Residuals")
abline(h = 0)

#Q-Q plot of the residuals
qqnorm(lmout$res)
qqline(lmout$res)

#Log of Standardized Residuals
plot(log(cell$vitC+1), rstandard(lmout), 
     xlab = "log(Vitamin C (mg) in first day observed diet)", 
     ylab = "Standardized Residuals",
     main = "Standardized Residuals versus log(vitC)")
abline(h = 0)
abline(h = 2)
abline(h = -2)


#Log of VitC raised to 0.25 versus WBC###########################

#include the origin on the plot
myxlims = c(0, max(log(cell$vitC^0.25)))
myylims = c(0, max(cell$wbc))

#Axis labels and titles
plot(log(cell$vitC^0.25), (cell$wbc),
     xlim = myxlims,
     ylim = myylims,
     xlab = "log (Vitamin C (mg) in first day observed diet)", 
     ylab = "White Blood Cell Count (1000 cells/ul)",
     main = "WBC versus log of Vitamin C ")

#Fit a regression line
lmout = lm(wbc ~ log(vitC^0.25), data = cell)

#Add regression line to the plot
abline(lmout)


#Square Root of VitC versus WBC###########################
#Square Root looks worse as well

myxlims = c(0, max(sqrt(cell$vitC)))
myylims = c(0, max(cell$wbc))

#Axis labels and titles
plot(sqrt(cell$vitC), (cell$wbc),
     xlim = myxlims,
     ylim = myylims,
     xlab = "Square Root Vitamin C (mg) in first day observed diet", 
     ylab = "White Blood Cell Count (1000 cells/ul)",
     main = "WBC versus Square Root of Vitamin C")

#Fit a regression line
lmout = lm(wbc ~ sqrt(vitC), data = cell)

#Add regression line to the plot
abline(lmout)

#Square Root Residuals Plot
plot(sqrt(cell$vitC), lmout$res,
     xlab = "sqrt(Vitamin C (mg) in first day observed)",
     ylab = "Residuals")
abline(h = 0)

#Q-Q plot of the residuals
qqnorm(lmout$res)
qqline(lmout$res)

#Square root of Standardized Residuals
plot(sqrt(cell$vitC), rstandard(lmout), 
     xlab = "sqrt(Vitamin C (mg) in first day observed diet)", 
     ylab = "Standardized Residuals",
     main = "Standardized Residuals versus sqrt(vitC)")
abline(h = 0)
abline(h = 2)
abline(h = -2)

#Log of UpperLeg versus WBC###########################

#include the origin on the plot
myxlims = c(0, max(log(cell$upperLeg)))
myylims = c(0, max(cell$wbc))

#Axis labels and titles
plot(log(cell$upperLeg), (cell$wbc),
     xlim = myxlims,
     ylim = myylims,
     xlab = "log (Upper Leg Length (cm))", 
     ylab = "White Blood Cell Count (1000 cells/ul)",
     main = "WBC versus log of Upper Leg Length ")

#Fit a regression line
lmout = lm(wbc ~ log(upperLeg), data = cell)

#Add regression line to the plot
abline(lmout)

#see what the values are on the table
summary(lmout)

#Residuals Plot
plot(log(cell$upperLeg+1), lmout$res,
     xlab = "log(Upper Leg Length (cm))",
     ylab = "Residuals")
abline(h = 0)


#lambda=0.25 of Upper Leg versus WBC###########################

#include the origin on the plot
myxlims = c(0, max((cell$upperLeg^0.25)))
myylims = c(0, max(cell$wbc))

#Axis labels and titles
plot((cell$upperLeg^0.25), (cell$wbc),
     xlim = myxlims,
     ylim = myylims,
     xlab = " (Upper Leg Length (cm))^0.25", 
     ylab = "White Blood Cell Count (1000 cells/ul)",
     main = "WBC versus Upper Leg Length^0.25 ")

#Fit a regression line
lmout = lm(wbc ~(upperLeg^0.25), data = cell)

#Add regression line to the plot
abline(lmout)

#see what the values are on the table
summary(lmout)


#Square Root of Upper Leg versus WBC###########################

myxlims = c(0, max(sqrt(cell$upperLeg)))
myylims = c(0, max(cell$wbc))

#Axis labels and titles
plot(sqrt(cell$upperLeg), (cell$wbc),
     xlim = myxlims,
     ylim = myylims,
     xlab = "Square Root Upper Leg Length (cm)", 
     ylab = "White Blood Cell Count (1000 cells/ul)",
     main = "WBC versus Square Root of Upper Leg Length")

#Fit a regression line
lmout = lm(wbc ~ sqrt(upperLeg), data = cell)

#Add regression line to the plot
abline(lmout)

#see what the values are on the table
summary(lmout)

#Residuals Plot
plot(cell$upperLeg, lmout$res,
     xlab = "Upper Leg Length (cm)",
     ylab = "Residuals")
abline(h = 0)

#Q-Q plot of the residuals
qqnorm(lmout$res)
qqline(lmout$res)

#Fit a regression line
lmout = lm(wbc ~ upperLeg, data = cell)

plot(cell$upperLeg, cell$wbc, 
     xlab = "Upper Leg Length (cm)", 
     ylab = "White Blood Cell Count (1000 cells/uL)",
     main = "UpperLeg versus WBC")
abline(lmout)

#Standardized Residuals
plot(cell$upperLeg, rstandard(lmout), 
     xlab = "Upper Leg Length (cm)", 
     ylab = "Standardized Residuals",
     main = "UpperLeg versus Standardized Residuals")
abline(h = 0)
abline(h = 2)
abline(h = -2)

#Q-Q plot of standardized residuals
qqnorm(rstandard(lmout))
qqline(rstandard(lmout))

#Leverage
hatvals = hatvalues(lmout)
round(hatvals, 3)
plot(cell$upperLeg, hatvals, xlab = "Upper Leg Length (cm)",
     ylab = "Leverage", main = "UpperLeg Leverage")
abline(h = 4/500)

#Cook's D
cooks_D = cooks.distance(lmout)
plot(cell$upperLeg, cooks_D,
     xlab = "Upper Leg Length (cm)t",
     ylab = "Cook's D")
abline(h=4/(nrow(cell)-2), lty =2)
