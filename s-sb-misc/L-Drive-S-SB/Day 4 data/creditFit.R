# ---------------------------------------------------------
# Author: Neumann Chew
# Date: 29 Jun 2016
# Purpose: Created R Code to do confusion matrix and Train/Test set spliting for credit data in Statistics Bootcamp day 4 Logistic Regression example.
# ---------------------------------------------------------

setwd("D:/NC/Rscripts/SSB")

credit <- read.csv("CreditCard.csv")

attach(credit)

upgraded <- factor(upgraded, levels=c(0,1), labels=c("No","Yes"))

extraCards <- factor(extraCards, levels=c(0,1), labels=c("No","Yes"))

creditFit <- glm(upgraded ~ purchases + extraCards, family = binomial, data = credit)

summary(creditFit)

# Likelihood ratio test: significance of the difference between the full model and the null model.

attach(creditFit)

pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE)

# Output the logistic function outcome for all cases.
prob <- predict(creditFit, type = 'response')

# Set the threshold for predicting Y = 1 based on logistic regression. One way is to use the proportion of "Yes" [Upgraded cases] in the data.

threshold <- sum(upgraded == "Yes")/length(upgraded)
                 
# If logistic regression probability > threshold, predict 1, else predict 0.
predict <- ifelse(prob>threshold, 1, 0)
                 
# Create a contingency table with actuals on rows and predictions on columns based on the entire dataset credit.
table(upgraded, predict)

# caTools package has a simple function to easily create train and test set.
install.packages("caTools")
library(caTools)

# Generate a random number sequence that can be reproduced to check results thru the seed number.
set.seed(22)

# Randomly split data from Y into two sets in predefined ratio while preserving relative ratios of different values in Y.
split <- sample.split(upgraded, SplitRatio = 0.7)

# Get training and test data
trainset <- subset(credit, split == TRUE)
testset <- subset(credit, split == FALSE)

# Develop logistic regression model on Trainset
model <- glm (upgraded ~ purchases + extraCards, data = trainset, family = binomial)

summary(model)

# Compute exp of parameters to get Odds Ratio of each variable.
# exp(coef(model))

# Confusion matrix on Trainset

probTrainset <- predict(model, type = 'response')

threshold2 <- sum(trainset$upgraded == "1")/length(trainset$upgraded)

predictTrainset <- ifelse(probTrainset>threshold2, 1, 0)

table(trainset$upgraded, predictTrainset)

AccuracyTrain <- mean(predictTrainset == trainset$upgraded)
print(paste('Trainset Accuracy = ',AccuracyTrain))

# Confusion matrix on Testset

probTestset <- predict(model, newdata=testset, type = 'response')

predictTestset <- ifelse(probTestset>threshold2, 1, 0)

table(testset$upgraded, predictTestset)

AccuracyTest <- mean(predictTestset == testset$upgraded)
print(paste('Testset Accuracy = ',AccuracyTest))

detach(creditFit)
detach(credit)


