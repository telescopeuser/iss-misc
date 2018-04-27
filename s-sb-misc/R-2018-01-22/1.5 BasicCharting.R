##########################
# BASIC CHARTING USING R #
##########################

###########################################################
# working directory
###########################################################
getwd()
#setwd("/home/iss-user/Desktop/workshop")
setwd("/media/sf_vm_shared_folder/my_github_repo/S-SB2018/telescopeuser/R-2018-01-22/")
getwd()

mtcars
mtcars$cyl
barplot(mtcars$cyl)
# pie(mtcars$cyl)

## count frequency for each category
counts_cyl = table(mtcars$cyl)
?table()
counts_cyl

## plot basic bar chart
barplot(counts_cyl)
pie(counts_cyl)
hist(mtcars$cyl)

## plot a simple histogram
hist(mtcars$mpg)

## plot histogram with specified bins
hist(mtcars$mpg, breaks=12, xlab="Miles Per Gallon", main="Histogram with 12 Bins")

# boxplot
boxplot(mtcars$mpg, main = "Boxplot of Miles/Gallon")

boxplot(mtcars$mpg~factor(mtcars$vs), main = "Boxplot of Miles/Gallon for Different Engine Types")


## basic scatter plot of MPG vs. Weight
plot(mtcars$wt, mtcars$mpg, main="Simple Scatter Plot of MPG vs. Weight", xlab="Car Weight (lbs/1000)", ylab="Miles Per Gallon")


## add a line to fit the data
abline(lm(mpg~wt, data = mtcars))

# how to find unique values of a dataframe column?
unique(mtcars$mpg)
length(unique(mtcars$mpg))

# what will happen if we plot entire dataframe?
plot(mtcars)

## more 'graphics' package information and examples 
library(help='graphics')
example('table')
example('barplot')
example('boxplot')
example('hist')
example('plot')
example('abline')
example('colors')
