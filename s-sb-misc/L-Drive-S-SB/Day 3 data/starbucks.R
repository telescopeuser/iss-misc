data <- read.csv(file="Triangle.csv")
attach(data)

# 1(a) Scatter Plot of X = Income, Y = Sales
plot(AvgDispIncome, Sales)

# 1(b) Corr Coef
cor(AvgDispIncome, Sales)
# 0.6982346

# 1(c) Simple LR
fit <- lm(Sales~AvgDispIncome)
summary(fit)

# --- Interpretation of LR ---
# An increase of $1 in Avg Disposable Income leads to a 0.19295 increase in Sales.
# -----------------------------

# 1(d) R squared
summary(fit)$r.squared 

# --- Interpretation of R squared ---
# 48.8% of the variability in Sales can be explained by the Linear Regression Model.
# -----------------------------

# Overlap fitted regression line into scatterplot.
abline(fit, col="red")

# Obs:
# Some issues at high values of X.

# 1(e) Residual Analysis
# par(mfrow=c(2,2))  # 4 Charts in a Plot.
plot(fit)

# Linear Relationship Assumption via REsiduals vs Fitted chart:
# Some curvation noted. To try quadratic term.
# Outliers to check in rows: 14, 110, 130.

# Residuals Normal Distribution Assumption via Normal Q-Q plot:
# No serious departure from normality assumption.
# Outliers to check in rows: 14, 110, 130.

# Residuals Constant Variance Assumption via Scale-Location chart:
# Rising trend at higher fitted values.

# Influential Obs Detection via Residuals vs Leverage chart:
# All cases within Cook's distance. No influenential Obs detected.

# 1(f) Level of Sig at 0.05
# At 0.05 level of significance, there is evidence of a linear relationship.

# 2. Should mean disposable income be used to predict sales based on the sample of 14 Sunflowers stores?
# Ans: No. Low R-squared of 48.8% and the rsiduals plot suggest that the model is not good enough.

# 3. Should the management of Sunflowers accept the claims of Triangle’s leasing agents? Why or why not?
# Ans: The claims cannot be verified as store size is not in the dataset. Add this variable inside the model to verify.

# 4. Are there any other factors not mentioned by the leasing agents that might be relevant to the store leasing decision?
# Ans: Yes. Other potential factors could be: Absence/Presence of competitors, Profile of the community - like sunflowers?

attach(starbucksP)
cor(Amount~., data=StarbucksP)
fit1 <- lm(Amount~., data=StarbucksP)
cor(Amount,Age+Days+Cups+Income)
plot(StarbucksP)
plot(Amount,Age+Days+Cups+Income)
shapiro.test(res)

fitted(Amount,Age+Days+Cups+Income)
predict(StarbucksPrepaid, starbucksP)
summary(StarbucksP)

starbucksP <- read.csv("StarbucksPrepaid.csv")
fit <- lm(Amount~.,data=starbucksP)
summary(fit)
Call:
  lm(formula = Amount ~ ., data = starbucksP)

Residuals:
  Min      1Q  Median      3Q     Max 
-37.874  -9.947  -2.351   7.332  56.872 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept) -83.8257    22.4944  -3.727  0.00133 ** 
  Age           0.2369     0.5759   0.411  0.68515    
Days          1.1897     1.4739   0.807  0.42909    
Cups          1.4216     2.6310   0.540  0.59494    
Income        2.4065     0.3597   6.690 1.64e-06 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 22.15 on 20 degrees of freedom
Multiple R-squared:  0.7546,  Adjusted R-squared:  0.7056 
F-statistic: 15.38 on 4 and 20 DF,  p-value: 6.758e-06

starbucksG <- read.csv("StarbucksGrowth.csv")
attach(starbucksG)
fit1 <- lm(Revenue~.,data=starbucksG)
fit2 <- lm(Amounty~Income,data=starbucksG)
summary(StarbucksGrowth)
summary(fit)
plot(fit)


cor(starbucksG)
fitted(StarbucksGrowth)
plot(StarbucksGrowth)
data2 <-read.csv("StarbucksGrowth.csv")
     
fit2 <-lm(Revenue~, ~Year-Stores,data=data2)
fit8 <-lm(Revenue~AveWeekEarnings,data=data2)
summary(fit8)
plot(fit8)

data1 <- read.csv(file="StarbucksPrepaid.csv")
attach(data1)

# Q1
fit1 <- lm(Amount ~ ., data = data1)  # fit all other variables
summary(fit1)
# Most promising is income.
fit2 <- lm(Amount ~ Income, data = data1)
summary(fit2)

par(mfrow=c(2,2))
plot(fit2)


# Q2
fit3 <- lm(Days ~ Age + Income + Cups, data = data1)
summary(fit3)
# Most promising is Number of Cups of Coffee per day.
fit4 <- lm(Days ~ Cups, data = data1)
summary(fit4)
plot(fit4)

detach(data1)

par(mfrow=c(1,1))
# Q3
data2 <- read.csv(file="StarbucksGrowth.csv")
attach(data2)
fit5 <- lm(Revenue ~ . - Year, data = data2)  # fit all other variables execpt Year
summary(fit5)
# Key Predictor is Ave Weekly Earnings.
# Caution: negative coef in Stores and Drinks.

fit6 <- lm(Revenue ~ . - Year -Stores, data = data2)  
summary(fit6)
plot(fit6)
# Caution: negative coef in Drinks. More drinks Variety => Substitution. Case 5 is a highly influential outlier.
cor(Drinks, AveWeekEarnings)
plot(Drinks, AveWeekEarnings)
fit7 <- lm(Revenue ~ Drinks, data = data2)
summary(fit7)
fit8 <- lm(Revenue ~ AveWeekEarnings, data = data2)
summary(fit8)
plot(fit7)
plot(fit8)

plot(Drinks, Revenue)
plot(AveWeekEarnings, Revenue)

par(mfrow=c(1,1))
detach(data2)

