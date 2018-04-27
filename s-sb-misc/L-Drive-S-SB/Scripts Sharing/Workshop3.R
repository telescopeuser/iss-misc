GSS2012 <- read.csv("GSS2012.csv")
head(GSS2012, 10)  # display the first few lines and see the actual data
tail(GSS2012)
names(GSS2012) # display variable names

dim(GSS2012)
summary(GSS2012)

#############################################
#
#         missing values
#
#############################################
table(GSS2012$marital) # counts for unique values

sum(GSS2012$marital == 0) # counts for missing values
sum(GSS2012$age == 0)
sum(GSS2012$sex == 0)
sum(GSS2012$race == 0)
sum(GSS2012$hompop == 0)
sum(GSS2012$happy == 0)
sum(GSS2012$health == 0)
sum(GSS2012$satjob == 0)
sum(GSS2012$fincome == 0)

# counts for missing values too
install.packages("Kmisc")
library(Kmisc)
dapply(GSS2012, function(x){
  sum(x == 0)
})

GSS2012$marital[GSS2012$marital == 0] <- NA
GSS2012$age[GSS2012$age == 0] <- NA
GSS2012$hompop[GSS2012$hompop == 0] <- NA
GSS2012$happy[GSS2012$happy == 0] <- NA
GSS2012$health[GSS2012$health == 0] <- NA
GSS2012$satjob[GSS2012$satjob == 0] <- NA
GSS2012$fincome[GSS2012$fincome == 0] <- NA


## same
GSS2012[GSS2012==0] <- NA




dim(GSS2012)
names(GSS2012)
summary(GSS2012)
sum(complete.cases(GSS2012))

sum(is.na(GSS2012$fincome))
sum(is.na(GSS2012$happy))

#############################################
#
#         Encode as factor
#
#############################################

str(GSS2012$marital)  # check the data structure
class(GSS2012$marital) # class or type of an object
summary(GSS2012$marital)
GSS2012$marital <- factor(GSS2012$marital, 
                          levels = c(1, 2, 3, 4, 5),
                          labels = c("Married", "Widowed", "Divorced",
                                     "Separated", "Never married"))
summary(GSS2012$marital)

class(GSS2012$sex)
GSS2012$sex <- factor(GSS2012$sex, levels = c(1, 2),
                      labels = c("Male", "Female"))

class(GSS2012$race)
GSS2012$race <- factor(GSS2012$race, 
                      levels = c(1, 2, 3),
                      labels = c("White", "Black", "Other"))

class(GSS2012$happy)
GSS2012$happy <- factor(GSS2012$happy, 
                        levels = c(1, 2, 3),
                        labels = c("Very happy", "Pretty happy",
                                   "Not too happy"))

class(GSS2012$health)
GSS2012$health <- factor(GSS2012$health, 
                        levels = c(1, 2, 3, 4),
                        labels = c("Excellent", "Good",
                                   "Fair", "Poor"))

class(GSS2012$satjob)
GSS2012$satjob <- factor(GSS2012$satjob, 
                         levels = c(1, 2, 3, 4),
                         labels = c("Very satisfied",
                                    "moderately satisfied",
                                    "A little dissatisfied",
                                    "Very dissatisfied"))


summary(GSS2012)

#############################################
#
#         Create a new variable
#
#############################################
GSS2012$pcincome <- GSS2012$fincome/GSS2012$hompop

#############################################
#
#         descriptive statistics
#
#############################################
dim(GSS2012)
summary(GSS2012)

#############################################
#
#      distribution of family income
#
#############################################
hist(GSS2012$fincome, prob = TRUE)
lines(density(GSS2012$fincome, na.rm = TRUE), col="blue")
boxplot(GSS2012$fincome)

#############################################
#
#   boxplots for exploring relationships
#
#############################################

## happiness ~ income
boxplot(GSS2012$fincome ~ GSS2012$happy)
## same
library(ggplot2)
ggplot(GSS2012[!is.na(GSS2012$happy),], aes(happy, fincome)) +
  geom_violin() 



## income ~ race
boxplot(GSS2012$fincome ~ GSS2012$race)

b1 <- ggplot(GSS2012, aes(x=marital, y=fincome))
b1 + geom_boxplot() + facet_grid(sex~happy)




#############################################
#
#   Subset Data
#
#############################################

GSS2012Middle <- subset(GSS2012, GSS2012$age >= 30 & GSS2012$age < 50)

summary(GSS2012Middle)
dim(GSS2012Middle)

# this command performs the same task
GSS2012Middle1 <- GSS2012[GSS2012$age >= 30 & GSS2012$age < 50 &
                            !is.na(GSS2012$age), ]
## happiness ~ income
boxplot(GSS2012Middle$fincome ~ GSS2012Middle$happy)

## income ~ race
boxplot(GSS2012Middle$fincome ~ GSS2012Middle$race)

#############################################
#
#   barplots for exploring relationships
#
#############################################

## happiness ~ marriage base graphics
opar <- par(no.readonly = TRUE)
par(mar=c(10, 4, 4, 2) + 0.1, xpd = TRUE)
barplot(prop.table(table(GSS2012$happy, GSS2012$marital),2), 
        beside = T, col=c("red", "orange", "light blue"),
        ylab = "Percentage", cex.names = 0.8)
legend("bottom", inset = -0.3,
       rownames(table(GSS2012$happy)),
       fill = c("red", "orange", "light blue"),
       horiz = TRUE, cex = 0.8,
       bty = "n")
par(opar)

## happiness ~ marriage ggplot2
hpy.mrt <- prop.table(table(GSS2012$happy, GSS2012$marital),2)
hpy.mrt <- as.data.frame(hpy.mrt)
colnames(hpy.mrt) <- c("happy", "marital", "percent")
ggplot(hpy.mrt, aes(marital)) +
  geom_bar(aes(y=percent, fill=happy), stat="identity",
               position="dodge") +
  scale_x_discrete(name="") +
  scale_y_continuous("Percentage") +
  scale_fill_hue("") +
  theme(legend.position = "bottom", legend.direction = "horizontal")

## happiness ~ sex
opar <- par(no.readonly = TRUE)
par(mar=c(10, 4, 4, 2) + 0.1, xpd = TRUE)
barplot(prop.table(table(GSS2012$happy, GSS2012$sex),2), 
        beside = T, col=c("red", "orange", "light blue"),
        ylab = "Percentage", cex.names = 0.8,
        mar = c(10, 4, 4, 2))
legend("bottom", inset = -0.3,
       rownames(table(GSS2012$happy)),
       fill = c("red", "orange", "light blue"),
       horiz = TRUE, cex = 0.8,
       bty = "n")
par(opar)

## happiness ~ race
opar <- par(no.readonly = TRUE)
par(mar=c(10, 4, 4, 2) + 0.1, xpd = TRUE)
barplot(prop.table(table(GSS2012$happy, GSS2012$race),2), 
        beside = T, col=c("red", "orange", "light blue"),
        ylab = "Percentage", cex.names = 0.8,
        mar = c(10, 4, 4, 2))
legend("bottom", inset = -0.3,
       rownames(table(GSS2012$happy)),
       fill = c("red", "orange", "light blue"),
       horiz = TRUE, cex = 0.8,
       bty = "n")
par(opar)

## happiness ~ health
opar <- par(no.readonly = TRUE)
par(mar=c(10, 4, 4, 2) + 0.1, xpd = TRUE)
barplot(prop.table(table(GSS2012$happy, GSS2012$health),2), 
        beside = T, col=c("red", "orange", "light blue"),
        ylab = "Percentage", cex.names = 0.8,
        mar = c(10, 4, 4, 2))
legend("bottom", inset = -0.3,
       rownames(table(GSS2012$happy)),
       fill = c("red", "orange", "light blue"),
       horiz = TRUE, cex = 0.8,
       bty = "n")
par(opar)

## happiness ~ job satisfaction
opar <- par(no.readonly = TRUE)
par(mar=c(10, 4, 4, 2) + 0.1, xpd = TRUE)
barplot(prop.table(table(GSS2012$happy, GSS2012$satjob),2), 
        beside = T, col=c("red", "orange", "light blue"),
        ylab = "Percentage", cex.names = 0.7,
        mar = c(10, 4, 4, 2))
legend("bottom", inset = -0.3,
       rownames(table(GSS2012$happy)),
       fill = c("red", "orange", "light blue"),
       horiz = TRUE, cex = 0.8,
       bty = "n")
par(opar)


#############################################
#
#         sort
#
#############################################
# sort based on happiness and store in a new dataframe
GSS2012Sort <- GSS2012[order(GSS2012$happy),]
head(GSS2012Sort, n = 50)

#############################################
#
#           Correlations
#
#############################################

plot(GSS2012$age, GSS2012$fincome)

## overall correlations ##
cor(cbind(GSS2012$happy, GSS2012$health, GSS2012$satjob, 
          GSS2012$fincome, GSS2012$pcincome), 
    use = "pairwise.complete.obs")

## marital ##
GSS2012Married <- subset(GSS2012, GSS2012$marital == "Married",
                         select = happy:pcincome)
attach(GSS2012Married)
cor(cbind(happy, health, satjob, fincome, pcincome), 
    use = "pairwise.complete.obs")
detach(GSS2012Married)

GSS2012NotMarried <- subset(GSS2012, GSS2012$marital != "Married",
                         select = happy:pcincome)
attach(GSS2012NotMarried)
cor(cbind(happy, health, satjob, fincome, pcincome), 
    use = "pairwise.complete.obs")
detach(GSS2012NotMarried)

##  age  ##
GSS2012Young <- subset(GSS2012, GSS2012$age >= 18 & GSS2012$age < 30,
                       select = happy:pcincome)
attach(GSS2012Young)
cor(cbind(happy, health, satjob, fincome, pcincome), 
    use = "pairwise.complete.obs")
detach(GSS2012Young)

GSS2012Middle <- subset(GSS2012, GSS2012$age >= 30 & GSS2012$age < 50,
                       select = happy:pcincome)
attach(GSS2012Middle)
cor(cbind(happy, health, satjob, fincome, pcincome), 
    use = "pairwise.complete.obs")
detach(GSS2012Middle)

GSS2012Elder <- subset(GSS2012, GSS2012$age >= 50,
                        select = happy:pcincome)
attach(GSS2012Elder)
cor(cbind(happy, health, satjob, fincome, pcincome), 
    use = "pairwise.complete.obs")
detach(GSS2012Elder)

##  sex  ##
GSS2012Male <- subset(GSS2012, GSS2012$sex == "Male",
                         select = happy:pcincome)
attach(GSS2012Male)
cor(cbind(happy, health, satjob, fincome, pcincome), 
    use = "pairwise.complete.obs")
detach(GSS2012Male)

GSS2012Female <- subset(GSS2012, GSS2012$sex == "Female",
                      select = happy:pcincome)
attach(GSS2012Female)
cor(cbind(happy, health, satjob, fincome, pcincome), 
    use = "pairwise.complete.obs")
detach(GSS2012Female)

##  race  ##
GSS2012White <- subset(GSS2012, GSS2012$race == "White",
                        select = happy:pcincome)
attach(GSS2012White)
cor(cbind(happy, health, satjob, fincome, pcincome), 
    use = "pairwise.complete.obs")
detach(GSS2012White)

GSS2012Black <- subset(GSS2012, GSS2012$race == "Black",
                       select = happy:pcincome)
attach(GSS2012Black)
cor(cbind(happy, health, satjob, fincome, pcincome), 
    use = "pairwise.complete.obs")
detach(GSS2012Black)

GSS2012Other <- subset(GSS2012, GSS2012$race == "Other",
                       select = happy:pcincome)
attach(GSS2012Other)
cor(cbind(happy, health, satjob, fincome, pcincome), 
    use = "pairwise.complete.obs")
detach(GSS2012Other)