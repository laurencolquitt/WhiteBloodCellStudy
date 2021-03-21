plot_variables <- function(x,y){
    #include the origin on the plot
    myxlims = c(0, max(cell[[x]]))
    myylims = c(0, max(cell$wbc))

    #Axis labels and titles
    plot(cell[[x]], cell$wbc,
        xlim = myxlims,
        ylim = myylims,
        xlab = y, 
        ylab = "White Blood Cell Count (1000 cells/ul)",
        main = x + " versus WBC")

    #Fit a regression line
    lmout1 = lm(wbc ~ x, data = cell)

    #Add regression line to the plot
    abline(lmout1)

    #see what the values are on the table
    summary(lmout1)

    #Residuals Plot
    plot(cell[[x]], lmout$res,
        xlab = y,
        ylab = "Residuals")
    abline(h = 0)
    identify(cell[[x]], lmout$residuals, n=1, rownames(cell))

    #Q-Q plot of the residuals
    qqnorm(lmout$res)
    qqline(lmout$res)

    #Fit a regression line
    lmout = lm(wbc ~ x, data = cell)

    plot(cell[[x]], cell$wbc, 
        xlab = y, 
        ylab = "White Blood Cell Count (1000 cells/uL)",
        main = x + " versus WBC")
    abline(lmout)
    
    #Standardized Residuals
    plot(cell[[x]], rstandard(lmout), 
        xlab = y, 
        ylab = "Standardized Residuals",
        main = x + " versus Standardized Residuals")
    abline(h = 0)
    abline(h = 2)
    abline(h = -2)

    #Q-Q plot of standardized residuals
    qqnorm(rstandard(lmout))
    qqline(rstandard(lmout))

    #Leverage
    hatvals = hatvalues(lmout)
    round(hatvals, 3)
    plot(cell[[x]], hatvals, xlab = y,
        ylab = "Leverage", main = x + " Leverage")
    abline(h = 4/500)

    #Cook's D
    cooks_D = cooks.distance(lmout)
    plot(cell[[x]], cooks_D,
        xlab = y,
        ylab = "Cook's D")
    abline(h=4/(nrow(cell)-2), lty =2)
}

plot_variables("ID","Unique Subject Identifier")
plot_variables("vitC","Vitamin C (mg) in first day observed diet")
plot_variables("upperLeg","Upper Leg Length (cm)")
plot_variables("kCal", "Calories in First Day Observed Diet")
plot_variables("carb","Carbohydrate (gm) in First Day Observed Diet")
plot_variables("ageMonths","Age (months) at Time of Physical Exam")
plot_variables("famSize", "Total Number of People in Family")
plot_variables("aveStep", "Average Daily Steps (Averaged over 7 Days, using a Step Counter)")
plot_variables("waistCirc", "Waist Circumference (cm)")
plot_variables("houseSize", "Total Number of People in Household")
plot_variables("armCirc", "Arm Circumference (cm)")
plot_variables("marital", "Marital Status (1 = currently married, 0 = other)")
plot_variables("gender", "1 = female, 0 = male")
plot_variables("rbc", "Red Blood Cell Count (1000 cells/ul)")
plot_variables("caffeine", "Caffeine (mg) in First Day Observed Diet")
plot_variables("platelet", "Platelet Count SI (1000 cells/ul)")
plot_variables("ethnicity", "Self-Reported Ethnicity or Race")

