##############################

###### DATA PREPARATION  #####

##############################

#Create a vector  with the c() function.

age = c(32, 45, 25, 39, 99)
# create a numeric vector

country = c("US", "US", "UK", "UK", "UK")
# create a character vector


#Extract values in a vector using square brackets []

age[1]
# extract the 1st element of vector age, indices in R start at 1, not at 0

age[c(1,3,5)]
# extract the 1st, 3nd, & 5th elements

country[2:4]
# extract the 2nd to the 4th elements


country[c(1,5)]
#Retrieve the 1st and 5th elements of the vector country.

#Element-wise addition Most operators work element-wise, i.e. they operate on each element.
x = c(2, 1, 3)
2 + x
x > 1

#When two vectors have different lengths, the elements of the shorter vector may be recycled.
#Typically a Warning is issued when this happens.
#For some functions, an error results.

x + c(1, 2)

# Create a data frame with the data.frame() function:
# create a vector for each column

manager = c(1,2,3,4,5)
country = c("US", "US", "UK", "UK", "UK")
gender = c("M", "F", "F", "M", "F")
age = c(32, 45, 25, 39, 99)
q1 = c(5, 3, 3, 3, 2)
q2 = c(4, 5, 5, 3, 2)
q3 = c(5, 2, 5, 4, 1)
q4 = c(5, 5, 5, NA, 2)
q5 = c(5, 5, 2, NA, 1)

# create a data frame by combining all the column vectors
leadership = data.frame(manager, country, gender, age, q1, q2, q3, q4, q5)

#Access Rows

leadership[2:4,] # access rows 2-4

#Access Columns

leadership[,2:4] # access columns 2-4
leadership[,c('country', 'gender', 'age')] # same
leadership$age # extract the variable age
leadership$age[2] # extract the 2nd element of the variable age

#For manager ID = 5
#extract manager ID and the corresponding rating of the five statements.

leadership[5,5:9]

#Extract the variable gender

leadership[5, 3]

#Use function factor() to encode a vector as a factor
# create a data frame without conversion

leadership = data.frame(manager, country, gender, age, q1, q2, q3, q4, q5, stringsAsFactors=FALSE)

# check the gender variable again
leadership$gender

# encode the gender vector as factor
leadership$gender = factor(leadership$gender)

# encode the country vector as factor
leadership$country = factor(leadership$country)

# copy text data file to your working directory
# import data from a space-delimited text file
leadershipTXT = read.table("leadership.txt", header=TRUE, sep=' ', stringsAsFactors=FALSE)
#make sure the path is correct and corresponding to the workig directory set

# copy csv data file to your working directory
# import data from a comma-delimited file
leadershipCSV = read.table("leadership.csv", header=TRUE, sep=',', stringsAsFactors=FALSE)

# Save a dataset to a comma-delimited file in the current working directory
write.table(leadershipCSV,'leadershipcsv.txt', sep=",")


#Saving dataframe into rdata file:
save(leadership, file='leadership.Rda')

#To call the data :
load('leadership.Rda')

# recode 99 for age to missing
# if the element in the age column equals to 99
# this element will be changed to NA
leadership$age[leadership$age==99] = NA

# recode the age variable to a categorical variable
leadership$agecat[leadership$age<=55] = "Young"
leadership$agecat[leadership$age>55 & leadership$age<=75] = "Middle Aged"
leadership$agecat[leadership$age>75] = "Elder"

# identify missing values
is.na(leadership)

# exclude missing values in calculation
mean(leadership$q4, na.rm=TRUE)

# remove observations with missing values
leadershipNoMissing = na.omit(leadership)

# create a mean score
attach(leadership)
leadership$mean = (q1+q2+q3+q4+q5)/5
detach(leadership)

# select observations in UK only and keep the variables q1 through q5
leadershipSubset = subset(leadership, leadership$country=="UK", select=q1:q5)

leadershipSubset

