library(devtools)
install_github("christophM/iml")

x = 5
x

x <- c(5,7,10)
class(x)

x1 <- (1:10)
class(x)

y <- c("cs","ds","ec")
class(y)

x3 <- c("A", 1)
x3
class(x3)

m <- matrix(data=c(1:12), nrow=3, byrow = FALSE)
m

x <- c(0:10)
y = c(-5:5)
c = rbind(x,y)
c

c1 = cbind(x,y)
c1

df = data.frame(x = 1:10, y = 11:20)
head(df)
tail(df)

colnames(df)
rownames(df)

Club = c("Juve", "Napoli", "Roma", "Inter")
Points = c(95, 91, 77, 72)

df_seria = cbind(Club, Points)
str(df_seria)

class(df_seria)
typeof(df_seria)

df_seria = data.frame(Club, Points)
str(df_seria)
typeof(df_seria)

my_list = list(df_seria, c)
str(my_list)

my_list

z = unlist(my_list)
z

attr(df_seria, "topic") = "sports"
df_seria

attr(df_seria, "topic")

a = 10
a > 5

log1 = c(5,6,FALSE)
typeof(log1)
log1

b  = c("AM", "GE", "AZ")
typeof(b)
b1 = c(b,T)
b1

b = as.factor(c("AM","GE","AZ"))
typeof(b)
as.numeric(b)
b

b = relevel(b, ref = "GE")
levels(b)
as.numeric(b)

v1 = c(1,2,3,NA,5)
is.na(v1)

v2 = c(12, "a", 12)
as.numeric(v2)

readLines("winter.csv", n= 2)
winter = read.csv("winter.csv", stringsAsFactors = FALSE)
str(winter)

readLines("winter.txt", n =2)

winter = read.csv("winter.txt", sep = "\t", stringsAsFactors = F)
str(winter)

Clubs = c("Juv", "NApoli", "roman", "inter")
Points = c(95,91,213,21)
names(Points) <- Clubs
Points
Points[2]
Points["Juv"]
Clubs[1:2]
Clubs[c(1,3)]

Club[c("Juv", "inter")]

install_github("HABET/CSE270")
library(SportsAnalytics270)

data("nba2009_2016")
str(nba2009_2016)

View(nba2009_2016)
summary(nba2009_2016)

nba = nba2009_2016
nba[, c(2,4:6)]
colnames(nba)

nba1 <- nba[, c("home.PTS", "away.PTS")]
nba1
colnames(nba1)

nba2 <- nba[,-c(1,2,4:6)]

#PAGE 77 idiot 

# class 2 

nba_exercise <- nba[1:100, c(2,3,5)]
nba_exercise1 <- nba[-c(250, 300:350), -c(5)]

mean(nba$home.PTS)
mean(nba$away.PTS)
table(nba$home.WL)


nba$diff = nba$home.PTS - nba$away.PTS

# nba for year = 2009
nba4 <- nba[nba$SEASON_ID == "2009",]
table(nba4$SEASON_ID)

#nba for 2009 and 2010
nba5 <- nba[nba$SEASON_ID %in% c("2009","2010"),]
table(nba5$SEASON_ID)

nba$SEASON_ID <- as.numeric(nba$SEASON_ID)
nba5 <- nba[nba$SEASON_ID < 2011, ]
table(nba5$SEASON_ID)

nba6 <- nba[nba$SEASON_ID %in% c(2010,2011) &
              nba$home.TEAM_NAME == "Detroit Pistons",]

table(nba6$home.TEAM_NAME, nba6$SEASON_ID)

nba7 <- nba[nba$home.TEAM_NAME == "Detroit Pistons" |
              nba$away.TEAM_NAME == "Detroit Pistons",]
head(nba7)

hist(nba$diff)

seriea <- data.frame(Club, Points)
seriea

list1 <- list(Club, "Italy", 2017, seriea)
list1


list1[[1]]

list1[1]
list1[1:2]

list1[[1]][2]

x <- 5 
if (x==5) {
  y <- x*5
}
y

x = 2
if (x==2) {
  y <- x*5
} else {
  y <- x
}
y

x  = -4
if (x<0) {
  x <- x^2
} else if (x==0){
  x <- 1
} else {
  x = sqrt(x)
}
x

for (i in 1:5) {
  print(i)
}

x = c(5:9)
for (i in x) {
  y <- x+2
}
y

data()
dim(mtcars)

x <- c()
for ( i in 1:ncol(mtcars)) {
  x1 = mean(mtcars[,i])
  x[i] = x1
}
x

formals(runif)

args(runif)
runif(10,1,2)

foo <- function(x, y=2) {
  x^y
}
foo(2,3)

norm <- function(x) {
  return((x-mean(x)/sd(x)))
}
norm(mtcars$mpg)

max_min <- function(x) {
  return(x - min(x)/(max(x) - min(x)))
}
max_min(mtcars$mpg)

df1 <- c()
for_all <- function(ds) {
  for(i in 1:ncol(ds)) {
    x <- max_min(ds[,i])
    df1 <- cbind(ds,x)
    #print(ds[,i])
  }
  df1 <- as.data.frame(df1)
  colnames(df1) <- colnames(ds)
  return(df1)
}

for_all(mtcars)





x <- as.Date("2018-06-18")
class(x)
as.numeric(x)
as.numeric(as.Date("1970-01-01"))


oil <- read.csv("oil.csv", stringsAsFactors = F)

oil$DATE <- as.Date(oil$DATE, format = "%d-%b-%y")
str(oil)

oil_2014 <- oil[oil$DATE >= "2014-01-01" & oil$DATE < "2015-01-01",]
head(oil_2014)


as.Date("2018-06-18")+1

as.Date("2018-06-18") - as.Date("2018-02-18")

oil$WEEKDAY <- weekdays(oil$DATE)
head(oil)

oil$MONTHS <- months(oil$DATE)
head(oil)

oil$DAY <- format(oil$DATE, "%d")
str(oil)

oil$DAY <- as.numeric(oil$DAY)
head(oil)


data("nba_east")
head(nba_east)

library(reshape2)
nba_long <- melt(nba_east,id.vars = c("Team", "Season"))
head(nba_long)

nba15 <- read.csv("week1/nba15.csv")
head(nba15)

nba15_long <- reshape(nba15, timevar = "H", idvar = "GAME_ID", direction = "wide")

head(nba15_long)

