#Identify Outliers
identify(cell$ID, lmout$residuals, n=1, rownames(cell))
#Outliers are 87, 484, 288, 435, 222, 95 
cell = cell[-87]
cell = cell[483,]

#Look at QQ plot
par(mfrow=c(2, 2))
x = cell$upperLeg^0.5
qqnorm(x, main="lambda = 0.5")
qqline(x)
x = cells$upperLeg^0.25
qqnorm(x, main="lambda = 0.25")
qqline(x)
x = cell$upperLeg^0.1
qqnorm(x, main="lambda = 0.1")
qqline(x)
x = log(cell$upperLeg)
qqnorm(x, main="lambda = 0 (log)")
qqline(x)
par(mfrow=c(1, 1))


#Q-Q plot does not look great. Try and fit a lambda. 
par(mfrow=c(2, 2))
x = cell$vitC^0.5
qqnorm(x, main="lambda = 0.5")
qqline(x)
x = cell$vitC^0.25
qqnorm(x, main="lambda = 0.25")
qqline(x)
x = cell$vitC^0.1
qqnorm(x, main="lambda = 0.1")
qqline(x)
x = log(cell$vitC)
qqnorm(x, main="lambda = 0")
qqline(x)
par(mfrow=c(1, 1))

#When lambda = 0.25 looks the best