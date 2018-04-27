# get some data from the mtcars build-in dataset
mydata <- mtcars[,c(1,3,4,5,6)]

## create a correlation matrix
cor(mydata)

pairs(~., data = mydata, main = "simple scatter plot")

install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
chart.Correlation(mydata)
