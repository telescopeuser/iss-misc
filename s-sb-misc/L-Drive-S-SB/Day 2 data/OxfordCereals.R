oxford <- read.csv("Oxford.csv")

attach(oxford)

hist(Weight)

boxplot(Weight, horizontal = T)

t.test(Weight, mu = 368, alternative = "greater")

detach(oxford)

CCACC <- read.csv("MoreOnCheaters.csv")

attach(CCACC)

boxplot(CCACC)

t.test(Plant1, Plant2)

detach(CCACC)