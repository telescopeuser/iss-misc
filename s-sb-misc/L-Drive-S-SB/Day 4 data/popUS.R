library(car)

attach(USPop)

plot(year, population, main = "Population Growth")
cor(year, population)
pop.fit1 <- lm(population ~ year)
abline(pop.fit1, col = "blue")
summary(pop.fit1)
plot(pop.fit1)

pop.fit2 <- lm(population ~ year + I(year^2))
summary(pop.fit2)
plot(pop.fit2)

anova(pop.fit1, pop.fit2, test="Chisq")

detach(USPop)