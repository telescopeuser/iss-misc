credit <- read.csv("CreditCard.csv")



require(caTools)
set.seed(22)
split <- sample.split(credit$upgraded, SplitRatio = 0.7)
trainset <- subset(credit, split==T)
testset <- subset(credit, split==F)
model <- glm(upgraded~purchases+extraCards, data=trainset, family=binomial)
summary(model)

probTrainset <- predict(model, type='response')
threshold2 <- sum(trainset$upgraded == "1")/length(trainset$upgraded)
predictTrainset <- ifelse(probTrainset > threshold2, 1, 0)
table(trainset$upgraded, predictTrainset)
AccuracyTrain <- mean(predictTrainset == trainset$upgraded)
print(paste('Trainset Accuracy = ', AccuracyTrain))

probTestset <- predict(model, newdata=testset, type='response')
# threshold2 <- sum(testset$upgraded == "1")/length(testset$upgraded)
predictTestset <- ifelse(probTestset > threshold2, 1, 0)
table(testset$upgraded, predictTestset)
AccuracyTest <- mean(predictTestset == testset$upgraded)
print(paste('Testset Accuracy = ', AccuracyTest))