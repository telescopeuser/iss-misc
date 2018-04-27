compensation <- read.csv("CEOCompensation.csv")

attach(compensation)

hist(Return, col = "light blue")

plot(Return, Compensation, 
     main = "Relationship between 
     Compensation and Return",
     font.main = 4,
     col.main = "red",
     pch = 1,
     col = "blue")
abline(lm(Compensation ~ Return), lwd = 2, col = "red")

boxplot(Compensation)

cor(Return, Compensation)

range(Compensation)
median(Compensation)
sd(Compensation)

detach(compensation)