hotel <- read.csv("Hotel.csv")

hotel$Sat <- factor(hotel$Sat, levels = c(0, 1), labels = c("unfavorable", "favorable"))

hotel$Prev <- factor(hotel$Prev, levels = c(0, 1),
                     labels = c("No", "Yes"))

hotelFit <- glm(Sat ~ TimeDiff + Prev, 
                family = binomial(),
                data = hotel)


summary(hotelFit)


predict(hotelFit, data.frame(TimeDiff = 3, Prev = "No"), type = "response")
