
#1) 
#Create a vector "a", containing integers from 1 to 100 and 200 to 300.
#Use help (bottom right corner in RStudio) and find a function that returns
#the length of an object and print the length of the vector.

a<-c(1:100,200:300)
length(a)

#2) 
#Create a vector "a" containing integers 1-5, letters A,B and C and boolean value TRUE.
#print the type of the vector and explain why is it of that type.

a<-c(1:5,"A","B","C",T)
class(a)
typeof(a)
#Coercion of integer, character and boolean results in character (most flexible).

#3a) 
#Generate a vector containing even numbers from 2 to 50 inclusive (Hint! ?seq)
#Build a 5x5 matrix and populate it with the vector generated above, where matrix 
#elements are increasing by row. Finally check whether R stored it as a matrix.

a<-seq(2,50,by=2)
m<-matrix(a,nrow=5,ncol=5,byrow = T)
m
is.matrix(m)
class(m)

#3b) 
#Print the element for which Row=3 Column=4. Make the diagonal elements of the matrix 0 (Hint! ?diag)

m[3,4]
diag(m)<-0
m

#4a) 
#Load the "SportsAnalytics270" library, load the dataset "nba2009_2016" 
#from it and save it in R with the name "nba".

library(SportsAnalytics270)
data("nba2009_2016")
nba<-nba2009_2016


#4b) 
#check the structure of the "nba" database and answer the following questions
#*) What is the number of rows and columns ?
#*) What are the datatypes of columns home.PTS, home.WL and home.TEAM_NAME

dim(nba)
str(nba)

#5) 
#Subset the dataframe "nba" into "nba_matches" which will store only home.TEAM_NAME, home.PTS,
#away.TEAM_NAME and away.PTS. Do the same by using column indexes and column names.

nba_matches1<-nba[,c(4,5,7,8)]
nba_matches2<-nba[,c("home.TEAM_NAME","home.PTS","away.TEAM_NAME","away.PTS")]


#6) 
#Subset the "nba" dataframe into "nba_1" containing those games, where the 
#minimum difference between points is 5. (Hint! ?abs)

nba_1<-nba[abs(nba$home.PTS-nba$away.PTS)>=5,]

#7) 
#Write a function that takes "x" as an argument and returns vector "y" containing all
#the divisors of "x".

c<-c()
divis<-function(x){
  for (i in 1:x)
    if(x%%i==0)
      c<-c(c,i)
    return(c)
}


#8) 
#Use for loop statement to populate a 5x5 square matrix with random numbers from
#the interval 1-10. (Hint! ?sample).

m<-matrix(NA,ncol=5,nrow=5)
for (i in 1:nrow(m))
  for (j in 1:ncol(m))
    m[i,j]=sample(1:10,1)

#9)
#Write a function that takes "x" vector as input and returns it in an increasing order.
#(Warning!!! Don't use any built in sorting function in R or from other libraries)

sortv <- function(x){
  n<-length(x)
  for(j in 1:(n-1)){
    for(i in 1:(n-j)){
      if(x[i]>x[i+1]){
        p<-x[i]
        x[i]<-x[i+1]
        x[i+1]<-p
      }
    }
  }
  return(x)
}

#10) 
# Load Exams dataset from Moodle, explain in what format (wide, long) it's represented
#and convert (If it is wide convert to long and if long convert to wide.)

Exams<-read.csv("Exams.csv")
#Every row is a key value combination so it is in a long format.
Exams_wide<-reshape(Exams, timevar = "Exam",idvar = "Person",direction = "wide")

