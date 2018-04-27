coca <- read.csv("CocaCola.csv")

coca$codedYear <- coca$Year - 1995

plot(coca$codedYear, coca$Revenues)

# simple linear regression
cocaFit1 <- lm(Revenues ~ codedYear, coca)
anova(cocaFit1)
summary(cocaFit1)
abline(cocaFit1)
lines(coca$codedYear, predict(cocaFit1), col = "blue")
plot(cocaFit1)

# polynomial regression
cocaFit2 <- lm(Revenues ~ codedYear + I(codedYear^2), coca)
anova(cocaFit2)
summary(cocaFit2)
plot(coca$codedYear, coca$Revenues)
lines(coca$codedYear, predict(cocaFit2), col = "red")
plot(cocaFit2)

predict(cocaFit1, data.frame(codedYear = 15))
predict(cocaFit1, data.frame(codedYear = 15),
        interval = "predict")
predict(cocaFit2, data.frame(codedYear = 15))
predict(cocaFit2, data.frame(codedYear = 15),
        interval = "predict")