## import data
McDonalds = read.csv("McDonalds.csv")
# McDonalds = read.csv("McDonalds2.csv")

attach(McDonalds)

Time

## point estimate for population mean
mean(Time)

## 95% confidence interval 
t.test(Time)


#############################################


## 99% confidence interval
t.test(Time, conf.level=0.99)

## 99% confidence interval
t.test(Time, conf.level=0.999999999999)

## 100% confidence interval
t.test(Time, conf.level=1)

## t test, two direction # note DF: Degree of Freedom
t.test(Time, mu=174.22)
## t test, left direction < mu=174.22
t.test(Time, alternative = "less", mu=174.22)
## t test, right direction > mu=174.22
t.test(Time, alternative = "great", mu=174.22)

## visualise the sample data
boxplot(Time, horizontal=TRUE, col="grey",
        main="Boxplot of Service Time",
        xlab="Service Time (seconds)")

## one-tail t test
t.test(Time, alternative="less", mu=174.22)

## evaluate normality
qqnorm(Time, col="blue", xlab="z Value", 
       ylab="Time")
qqline(Time, col="red", lwd=2)

detach(McDonalds)
