

# 1) (1p)
# Create a vector "a", containing integers from 1 to 100 and 200 to 300.
# Use help (bottom right corner in RStudio) and find a function that returns
# the length of an object and print the length of the vector.

a <- c(1:100, 200:300)
length(a)


# 2) (2p)
# Create a vector "a" containing integers 1-5, letters A,B and C and a boolean value TRUE.
# print the type of the vector and explain why is it of that type.
a <- c(1:5, "A", "B", "C", T)
class(a) # chracter
##  they are character because they were made with the combine, so its combined into a vector


# 3a) (2p)
# Generate a vector containing even numbers from 2 to 50 inclusive (Hint! ?seq)
# Build a 5x5 matrix and populate it with the vector generated above, where matrix
# elements are increasing by row. Finally check whether R stored it as a matrix.
mat= matrix(seq(2,50,2), nrow = 5, byrow = T)
class(mat) #matrix
# 3b) (1p)
# Print the element for which Row=3 Column=4. Make the diagonal elements of the matrix 0 (Hint! ?diag)
mat[3,4]

diag(mat) = 0
mat

# 4a) (1p)
# Load the "SportsAnalytics270" library, load the dataset "nba2009_2016"
# from it and save it in R with the name "nba".
library(SportsAnalytics270)
data("nba2009_2016")
nba <- nba2009_2016
# 4b) (2p)
# check the structure of the "nba" database and answer the following questions.
# *) What is the number of rows and columns ?
# -> 9600 rows with 9 columns
# *) What are the datatypes of columns "home.PTS", "home.WL" and "home.TEAM_NAME"
class(nba$home.PTS) #numeric
class(nba$home.WL)  #character
class(nba$home.TEAM_NAME) # factor

# 5) (3p)
# Subset the dataframe "nba" into "nba_matches" which will store only home.TEAM_NAME, home.PTS,
# away.TEAM_NAME and away.PTS. Do the same by using column indexes and column names.
nba_matches <- subset(nba, select = c("home.TEAM_NAME","home.PTS","away.TEAM_NAME","away.PTS"))
nba_matches <-nba[,c(4:5,7:8)]
# 6) (3p)
# Subset the "nba" dataframe into "nba_1" containing onyl those games, where the
# minimum difference between points is 5. (Hint! ?abs)
nba1 <- nba[which(abs(nba$home.PTS - nba$away.PTS) < 5), names(nba)]
nba1
# 7) (4p)
# Write a function that takes "x" as an argument and returns vector "y" containing all
# the divisors of "x". (Hint! x%%y expression shows the remainder when x is divided by y)

func <- function(x) {
  y <- c(1:x)
  y[x%%y == 0]
}
func(100)
# 8) (3p)
# Use for loop statement to populate a 5x5 square matrix with random numbers from
# the interval 1-10. (Hint! ?sample).

x = matrix(data=NA, nrow= 5, ncol= 5)
for (j in 1:5) {
  for (i in 1:5) {
    x[i,j] = sample(10, size = 1)
  }
}
x
#9) (5p)
# Write a function that takes "x" vector as an input and returns it in an increasing order.
# (Warning!!! Don't use any built in sorting function in R or from other libraries)
# (Hint! There are many sorting algorithms used to sort a vector, an array etc. One is bubblesort)


x <- sample(10)

insertion_sort <- function(arr) {
  for (i in 2:length(arr)) {
    key = arr[i]
    
    j = i-1
    while(j > 0 && key < arr[j] ) {
      arr[(j+1)] = arr[j]
      j = j -1
    }
    arr[(j+1)] = key
  }
  return(arr)
}
insertion_sort(x)


# 10) (3p)
# Load Exams dataset from Moodle, explain in what format (wide, long) it's represented
# and convert vice versa(If it is wide, convert to long and if long, convert to wide.)
exams <- read.csv("HomeWorks/Homework1/Exams.csv")
exams <- read.csv("Exams.csv")
# this is long format becuase every row is key-value combination
library(reshape2)
exams_wide <- reshape(data = exams,timevar = "Exam",idvar = "Person", direction = 'wide')
