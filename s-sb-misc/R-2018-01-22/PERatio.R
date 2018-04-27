# import data
PERatio = read.csv("PERatio.csv")

attach(PERatio)

#Testing for Normality on Year1 data
shapiro.test(Year1)


#Testing for Normality on Year 2 data
shapiro.test(Year2)


#Testing for Equal variance
ansari.test(Year1, Year2)


# t test
t.test(Year1, Year2, paired = TRUE, var.equal=TRUE)

# 2 related samples --> 1 sample (test) of the difference
Diff = Year1 - Year2
Diff
t.test(Diff)
t.test(Diff, paired = FALSE, var.equal=TRUE)

detach(PERatio)