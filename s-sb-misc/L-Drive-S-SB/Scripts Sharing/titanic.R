

# titanic
titanic <- read.csv("http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.csv")


dim(titanic)


nhead(titanic)
summary(titanic)
titanic$age.g <- as.integer(cut(titanic$age, 10))

# calculate survival rate for different combination of class, 
# age group, and sex

library(plyr)
td <- ddply(titanic, c("pclass", "age.g", "sex"), summarise,
            total = length(survived),
            svv = length(survived[survived == 1]),
            ps = svv/total)

# create ggplot base object
p6 <- ggplot(td, aes(x = age.g, y = ps))

# create scatter plot
p6 + geom_point()

# create scatter plot with color and shape and size
p6 + geom_point(aes(colour = factor(pclass), shape = sex), size=3)

# create facet create scatter plot side by side with attribute pclass
p6 + geom_point(aes(shape = sex)) + facet_wrap(~ pclass)

p6 + geom_point(aes(shape = sex)) + facet_wrap(~ pclass, nrow=3)

p6 + geom_point(aes(shape = sex)) + facet_grid(pclass ~.)

# scatter plot with facet ( x ~ y)
p6 + geom_point() + facet_grid(sex ~ pclass)

# add themes
p6 + geom_point() + facet_grid(sex ~ pclass) + theme_excel()


# slide 54
p4 + theme(panel.background = element_rect(fill = "white", 
                                           colour = "gray40"))

# slide 55
theme_new <- theme_bw() +
  theme(text=element_text(size = 12, family = ""),
        axis.text.x = element_text(colour = "red"),
        panel.background = element_rect(fill = "orange"))
p4 + theme_new

