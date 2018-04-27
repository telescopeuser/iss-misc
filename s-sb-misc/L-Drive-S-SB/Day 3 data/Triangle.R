# ---------------------------------------------------------------
# Author: Neumann Chew
# Date of Creation: 15 Jun 2016.
# Purpose: Solution to Workshop 5.
# ---------------------------------------------------------------

setwd("C:/Users/lecturer/Desktop/rscripts")

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



