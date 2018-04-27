## inform R where to search the variables
attach(mtcars)


head(mtcars)
dim(mtcars)

# read column names
colnames(mtcars)

# summary
summary(mtcars)

## count frequency for each category
counts_cyl <- table(cyl)
counts_cyl

## plot bar chart
barplot(counts_cyl,
        main="Simple Bar Chart",
        xlab="Number of Cylinders", ylab="Frequency")



## cross-tabulation of number of cylinders and transmission type
counts_cyl_am <- table(cyl, am)
counts_cyl_am

## grouped bar chart
barplot(counts_cyl_am,
        main="Grouped Bar Chart",
        xlab="Transmission Type", ylab="Frequency",
        legend=rownames(counts_cyl_am),
        beside=TRUE)


## plot simple histogram
hist(mpg)

## plot histogram with specified bins
hist(mpg, 
     breaks=12,
     xlab="Miles Per Gallon",
     main="Histogram with 12 Bins")

boxplot(mpg, main = "Boxplot of Miles/Gallon")
plot_ly(mtcars, y=mpg, type='box')


boxplot(mtcars$mpg~factor(mtcars$cyl), main = "Boxplot of Miles/Gallon")
boxplot(mtcars$mpg~factor(mtcars$vs), main = "Boxplot of Miles/Gallon for Different Engine Types")
boxplot(mtcars$mpg~factor(mtcars$gear), main = "Boxplot of Miles/Gallon")

## scatter plot of MPG vs. Weight
plot(wt, mpg,
     main="Scatter Plot of MPG vs. Weight",
     xlab="Car Weight (lbs/1000)",
     ylab="Miles Per Gallon")

## Customise the scatter plot
plot(wt, mpg,
     main="Scatter Plot of MPG vs. Weight", # title
     xlab="Car Weight (lbs/1000)",          # x axis label
     ylab="Miles Per Gallon",               # y axis label
     font.lab=2,                            # bold label
     cex.axis=0.8,                          # shrink axis size
     pch=16,                                # change point symbol
     col="blue")                            # set point colour

## add a line to fit the data
abline(lm(mpg~wt),                          # add a regression line
       col="red",                           # set line colour
       lty=3,                               # set line type
       lwd=2)                               # set line width


detach(mtcars)

summary(mtcars)
colnames(mtcars)
ggplot(mtcars,aes(x=factor(vs),y=mpg))+geom_boxplot()
plot1=ggplot(mtcars,aes(x=factor(vs),y=mpg))+geom_boxplot()
plot1+geom_point()

ggplot(mtcars,aes(x=wt,y=hp,color=factor(am)))+geom_point()+facet_wrap(~factor(am))

ggplot(mtcars,aes(x=wt,y=hp,color=factor(am)))+geom_point()+facet_grid(vs~am)

