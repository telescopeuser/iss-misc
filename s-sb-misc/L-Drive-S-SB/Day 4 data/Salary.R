mSalary <- read.csv("Salary.csv")
summary(mSalary)
mSalaryFit <- lm(salary ~ age + sex, mSalary)
summary(mSalaryFit)

mSalaryFit2 <- lm(salary ~ sex, mSalary)
summary(mSalaryFit2)

mSalary$sex <- relevel(mSalary$sex, ref="M")
levels(mSalary$sex)
mSalaryFit3 <- lm(salary ~ sex, mSalary)
summary(mSalaryFit3)

library(ggplot2)

p <- ggplot(mSalary, aes(age, salary))
p + geom_point(aes(colour=sex)) + 
  geom_smooth(method="lm", aes(colour=sex)) +
  ggtitle("Regression Model for Male and Female")

qplot(age, salary, data=mSalary, 
      geom=c("point", "smooth"), 
      color=sex, shape=sex, 
      method="lm", formula=y~x,
      asp=1:1, xlab="Monthly Salary ($1,000)", 
      ylab="Age (10 years)",
      main="Regression Model for Male and Female")