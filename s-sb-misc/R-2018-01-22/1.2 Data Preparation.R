# Vectors
# A vector is simply a list of values with the same type. 

# Create a vector  with the c() function.
age <- c(32, 45, 25, 39, 99) 	# create a numeric vector
country <- c("US", "US", "UK", "UK", "UK") # create a character vector

# Extract values in a vector using square brackets []
age[1] # extract the 1st element of vector age, indices in R start at 1, not at 0
age[c(1,3,5)] # extract the 1st, 3nd, & 5th elements
country[2:4] # extract the 2nd – 4th elements

# Operators
# Element-wise – Most operators work element-wise, i.e. they operate on each element.
x <- c(2, 1, 3)
2 + x
print(x)
x > 1
# Recycling – When two vectors have different lengths, the elements of the shorter vector may be recycled.
# Typically a Warning is issued when this happens.
# For some functions, an error results.
x + c(1, 2)
x + c(1, 2, 3)
x + c(1, 2, 3, 4)

# Data Frames
# A dataset is most commonly represented by rows and columns. R uses data frames to handle this type of structure.

# Create a data frame with the data.frame() function:
# create a vector for each column
manager <- c(1,2,3,4,5)
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
# create a data frame by combining all the column vectors
leadership <- data.frame(manager, country, gender, 
                         age, q1, q2, q3, q4, q5)

print(leadership)

# Access Rows
leadership[2:4,] # access rows 2-4

# Access Columns
leadership[,2:4] # access columns 2-4
leadership[,c('country', 'gender', 'age')] # same
leadership$age # extract the variable age
leadership$age[2] # extract the 2nd element of the variable age

# Factor
# Use function factor() to encode a vector as a factor
# create a data frame without conversion
leadership <- data.frame(manager, country, gender, 
                         age, q1, q2, q3, q4, q5,
                         stringsAsFactors=FALSE)
# check the gender variable again
leadership$gender
# encode the gender vector as factor
leadership$gender <- factor(leadership$gender)
# encode the country vector as factor
leadership$country <- factor(leadership$country)

leadership

write.table(leadership, "leadership.txt", sep = ",")

