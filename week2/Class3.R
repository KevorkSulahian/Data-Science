data("iris")
str(iris)
library(ggplot2)

plot1 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))
plot1

plot1 +geom_point()

ggplot() + geom_point(data = iris, aes(x = Sepal.Length, y = Sepal.Width))

# the write way to write it
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point()

plot1 + geom_violin()
plot1 + geom_line()

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point(color="blue", size = 3, shape= 11)

# colors

col2rgb(col = 1:6)
col2rgb("gold")

rgb(255,215,0, maxColorValue = 255)

library(RColorBrewer)
brewer.pal(n = 5,name = "Set3")

Species <- c("setosa", "versicolor", "virginica")

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, color = Species) ) +
  geom_point() #+
  #scale_color_manual(values = c("red","blue","yellow"))

install.packages("wesanderson")
library(wesanderson)
wes_palette(name = "IsleofDogs2")

wes_palettes$Darjeeling1

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, color = Species) ) +
  geom_point() +
  scale_color_manual(values = c("#FF0000", "#00A08A", "#F2AD00"))

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, color = Species) ) +
  geom_point() +
  scale_color_brewer(palette = "Set3")

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, color = Species) ) +
  geom_point() +
  scale_color_manual(values= wes_palette("GrandBudapest1"))

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Petal.Length) ) +
  geom_point() 
  
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, shape = Petal.Length) ) +
  geom_point()

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, size = Petal.Length, color = Species) ) +
  geom_point()

### HISTOGRAMS

movies <- read.csv("week2/movies3.csv")

ggplot(movies, aes(x=imdbRating, fill = "red")) + geom_histogram(bins = 47,binwidth = .2)

Batsy <- movies[movies$title == "zoom",]

# VISUALIZING CATEGORICAL DATA  

summer <- read.csv("week2/summer.csv")
summer_usa <- summer[summer$Country == "USA",]

ggplot(summer_usa, aes(x=Medal)) + geom_bar()


summer_usa$Medal <- factor(summer_usa$Medal, levels = c("Silver", "Gold", "Bronze"))
levels(summer_usa$Medal)

ggplot(summer_usa, aes(x = Medal, fill = Medal)) + geom_bar()

usa_medals <- data.frame(Medal =c("Silver", "Gold", "Bronze"),
                         Percentage= c(0.27,0.49,0.24))

ggplot(usa_medals, aes(x=Medal, y= Percentage) + geom_bar(stat = "identity", fill = c(4,5,8)))

summer_usa$Medal <- factor(summer_usa$Medal, levels = c("Bronze","Silver","Gold"))
ggplot(summer_usa, aes(x = Year, fill=Medal)) + geom_bar(position = "dodge")


1+1
                                                           
ggplot(summer_usa, aes(x=factor(1), fill=Medal)) + geom_bar()



ggplot(summer_usa, aes(x= factor(1), fill= Medal)) + geom_bar(width = 1) +
  coord_polar(theta = "y")

ggplot(movies, aes(x=Metascore, y = imdbRating)) + geom_point(alpha= .3, col = "red", size=2.7) +
  coord_cartesian((ylim=c(5,10)), xlim = c(50,100))


ggplot(iris, aes(x = Species, y = Sepal.Length)) + geom_boxplot()

ggplot(iris, aes(x = Species, y = Petal.Length)) + geom_boxplot()

options(scipen = 999)
ggplot(movies, aes(x = gross_adjusted)) + geom_histogram()

ggplot(movies, aes(y = gross_adjusted,x = "")) + geom_boxplot() +
  coord_cartesian(ylim = c(0,800000000))

ggplot(movies, aes(x = Metascore)) + geom_histogram()

ggplot(movies, aes(y = Metascore, x = "")) + geom_boxplot() + coord_flip()

ggplot(movies, aes(x = Metascore, y = imdbRating)) + geom_point() + scale_x_log10()

ggplot(movies, aes(x = Metascore, y = imdbRating)) + geom_point() + scale_y_sqrt()

movies_sub <- movies[movies$genre_first %in% c("Action", "Comedy") &
                       movies$Rated %in% c("PG", "PG-13", "R"),]

# facet_grid makes mulltiple rows/colums based on where the formula is  "something"~ = row
# ~"something" = col
ggplot(movies_sub, aes(x = Metascore, y = imdbRating)) + geom_point() + facet_grid(Rated~.)
  
ggplot(movies_sub, aes(x = imdbRating)) + geom_histogram(fill="red") + facet_grid(Rated~genre_first)

ggplot(movies_sub, aes(x = Metascore, y = imdbRating)) + geom_point() +
  ggtitle("IMDB rating vs asdaf") + xlab("Meta") + ylab("Rate") +
  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_line(color = "red"),
        axis.text.x = element_text(size = 15, color= "red", face = "italic"),
        axis.title.x = element_text(color = "blue", size = 16),
        axis.ticks.x = element_line(size = 1.5, color = "green"))

movies4 <- read.csv("week2/movies4c.csv", stringsAsFactors = F, na.strings = c("NA", "#NAME?", "#DIV/0!"))

sapply(movies4, class)

unique(movies4$imdbRating)

summary(movies4$imdbRating)

movies4$imdbRating <- ifelse(movies4$imdbRating > 10, NA, movies4$imdbRating)
summary(movies4$imdbRating)

unique(movies4$genre_first)

movies4$genre_first <- toupper(movies4$genre_first)
table(movies4$genre_first)
  
movies4$genre_first <- trimws(movies4$genre_first)
table(movies4$genre_first)

movies4$imdbVotes <- gsub("[,]","", movies4$imdbVotes)
movies4$imdbVotes <- as.numeric(movies4$imdbVotes)
summary(movies4$imdbVotes)

#DATA MANIPULATIONS

x <- c()
for (i in 1:ncol(mtcars)) {
  x1 <- mean(mtcars[,i])
  x <- c(x,x1)
}
x

data("mtcars")
apply(mtcars, 2, mean) # 2 is for col
apply(mtcars, 1, mean) # 1 if for row


a <- apply(mtcars, 2, quantile, probs=c(.25,.5,.75))
class(a)
a

normalize_df <- function(df) {
  normalize <- function(x) {
    return ((x-min(x))/ (max(x) - min(x)))
  }
  
  df1 <- c()
  for (i in 1:ncol(df)) {
    x <- normalize(df[,i])
    df1 <- cbind(df1,x)
  }
  df1 <- as.data.frame(df1)
  colnames(df1) <- colnames(df)
  return(df1)
}
normalize <- function(x) {
  return ((x- min(x))/ (max(x) - min(x)))
}

mtcars_norm <- apply(mtcars, 2, normalize)
class(mtcars_norm)
mtcars_norm <- as.data.frame(mtcars_norm)
head(mtcars_norm)

mtcars_norm1 <- apply(mtcars, 2, function(x) (x-min(x))/ (max(x)- min(x)))
mtcars_norm1 <- as.data.frame(mtcars_norm1)
head(mtcars_norm1)

identical(mtcars_norm1, mtcars_norm)

lapply(mtcars,mean)

l1 <- list(
  x = matrix(rnorm(50), ncol = 5),
  y = matrix(rnorm(30), ncol = 2),
  z = 1:25
)
l1

lapply(l1, mean)

sapply(l1, mean)

movies <- read.csv("week2/movies3.csv", stringsAsFactors = F)
sapply(movies, is.numeric)

movies_num <- movies[, sapply(movies, is.numeric)]
summary(movies_num)

library(dplyr)

summer <- read.csv("week2/summer.csv", stringsAsFactors = F)

summer_usa <- summer %>%
  filter(Country == "USA")

table(summer_usa$Country, summer_usa$Medal)

summer %>%
  filter(Country %in% c("USA", "FRA", "GBR")) %>%
  group_by(Country, Medal) %>%
  summarise(Count = n()) %>%
  ggplot(aes(x= Medal, y = Count, fill = Medal)) + geom_bar(stat = "identity") +
  facet_grid(.~Country)

movies <- read.csv("week2/movies3.csv")  

sum_movies <- movies %>%
  group_by(genre_first) %>%
  summarise(count = n(), mean= mean(gross_adjusted),
            standard_dev= sd(gross_adjusted)) %>%
  arrange(desc(mean))
head(sum_movies)

ggplot(sum_movies, aes(x = mean, y = standard_dev, size = count)) + geom_point() +
  geom_text(aes(label = genre_first), size = 3) +
  labs(x = "mean", y = "sd", title="mean vs sd 4 genres")

nba15 <- read.csv("week1/nba15.csv", stringsAsFactors = F)
str(nba15)

nba15$GAME_DATE_EST <- as.Date(nba15$GAME_DATE_EST, format = "%Y-%m-%d")
str(nba15)

x <- c(5,6,7,9,10,5)
x

diff_x <- diff(x,lag = 1)

nba15 <- nba15 %>%
  arrange(GAME_DATE_EST) %>%
  group_by(TEAM_ABBREVIATION) %>%
  mutate(REST_DAYS = c(NA, diff(GAME_DATE_EST)))

summary(nba15)

nba15$REST_DAYS_F <- factor(nba15$REST_DAYS)
levels(nba15$REST_DAYS_F)

ggplot(nba15, aes(x= REST_DAYS_F, y = PTS)) + geom_boxplot() +
  labs(x= "REST", y = "POINTS", title = "BOXPLOT OF POINTS  BY REST DAY") 
ggplot(nba15, aes(x= REST_DAYS_F, y = PTS)) + geom_boxplot() +
  labs(x= "REST", y = "POINTS", title = "BOXPLOT OF POINTS  BY REST DAY") + facet_grid(H~.)

nba15 <- nba15 %>%
  arrange(GAME_DATE_EST, GAME_ID, H) %>%
  group_by(GAME_ID) %>%
  mutate(WIN_H = c(NA, diff(PTS)),
         WIN_A = -dplyr::lead(WIN_H, 1))

nba15 <- as.data.frame(nba15)  
head(nba15)

nba15$PTS_DIF <- rowSums(nba15[,c("WIN_A", "WIN_H")], na.rm = T)
nba15$WIN_LOSE <- ifelse(nba15$PTS_DIF > 0 & nba15$H == "H", "WIN",
                         ifelse(nba15$PTS_DIF >0 & nba15$H =="A", "WIN", "LOSE"))

table(nba15$PTS_DIF>0, nba15$WIN_LOSE)

ggplot(nba15, aes(x = REST_DAYS_F, fill = WIN_LOSE)) + geom_bar(position = "fill") + 
  facet_grid(.~H) +
  labs(x = "REST DAY", y = "PROBABILITIES", title="probability to win for home/away", fill = "Result of the game")
x``