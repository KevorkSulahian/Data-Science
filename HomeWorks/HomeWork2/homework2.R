video_games <- read.csv("HomeWorks/HomeWork2/Video_Games.csv", stringsAsFactors = F)
#1)
library(dplyr)
library(tidyverse)
games <- video_games %>% 
  select(-c(Publisher, JP_Sales, Critic_Count, User_Count, Developer)) %>%
  mutate(NA_Sales = video_games$NA_Sales * 1000000,
         EU_Sales = video_games$EU_Sales * 1000000,
         Global_Sales = video_games$Global_Sales * 1000000) %>%
  filter(NA_Sales >= 20000, EU_Sales >= 20000,
         Rating =='E' | Rating == 'M' | Rating == 'T' | Rating == 'E10+' | Rating == 'AO')

# 2)
str(games)
sapply(games, class)
unique(games$User_Score)
unique(video_games$Year)
games$User_Score <- as.numeric(games$User_Score)
games$Year <- as.numeric(games$Year)

summary(games$Year)

summary(games$Critic_Score)
games$Critic_Score <- ifelse(games$Critic_Score > 100, NA, games$Critic_Score)
summary(games$Critic_Score)

summary(games$User_Score)
games$User_Score <- ifelse(games$User_Score > 10, NA, games$User_Score)
summary(games$User_Score)

unique(games$Platform) #looks ok 

unique(games$Genre) # repeating names (uppercase problem)
games$Genre <- toupper(games$Genre)
unique(games$Genre) #spaces yo
games$Genre <- trimws(games$Genre)
unique(games$Genre)


#3)

library(ggplot2)

ggplot(games, aes(x = User_Score, y = Critic_Score)) + geom_point() +
  labs(x= "User Scoes", y= "Critic Scores", title = "User vs Critic") +
  geom_point(color = "red", shape=2, alpha = 0.2)
#they increase together, this means that they are dependent 

#4)
options(scipen=10000)
ggplot(games, aes(x = User_Score, y = Global_Sales)) + geom_point() +
    coord_cartesian(ylim = c(40000,10000000))
# we can see a linear regression with some mistakes

#5)
ggplot(games, aes(x = User_Score, y = Global_Sales)) + geom_point(color="red", shape = 1) +
  coord_cartesian(ylim = c(40000,10000000)) +
  labs(x="Score given by the User", y = "Global Sales of the game", title = "User Score versus Global Sales") +
  theme(axis.title.x = element_text(size = 15, color = "red", face = "bold"),
        axis.title.y = element_text(size = 15, color = "red", face = "bold"),
        axis.text = element_text(face = "bold", color = "black"),
        panel.background = element_rect(fill="#09f2d5")) +
  geom_point(color="black", shape = 0, size =1.5) +
  coord_cartesian(ylim = c(40000,10000000))
        
#6)
ggplot(games, aes(x = Genre)) +geom_histogram(stat = "count") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#Action, Sports, Shooter

#7)
games$Rating <- as.factor(games$Rating)
ggplot(games, aes(x = User_Score, y = NA_Sales)) + geom_point() +
  facet_grid(.~Rating) + #or Rating.~  
  labs(x = "User Score", y = "North America Sales", title = "User Score vs NA Sales" )

#8)

ggplot(games, aes(x = Genre, y = Global_Sales)) + geom_boxplot() +
  theme(axis.text.x = element_text(angle=90)) +
  labs(y = "Global Sales")


#9)

ggplot(games, aes(x = Genre, y = Global_Sales)) + geom_boxplot() +
  theme(axis.text.x = element_text(angle=90)) +
  labs(y = "Global Sales") +
  coord_cartesian(ylim = c(0,2000000)) 
#(Comment for 8-9) As we can see the median for all genres is closer to the first quartile than it is to the third quartile. 
#Shooter genre has the highest 3rd quartile. Adventure genre has the lowest 1st quartile.
#All of them have a lot of outliers but the Sports' outlier is the highest as we saw

#As we can see the shooter games almost have the highest sales but overall they are all pretty close to each other
#10)
# 
games %>%
  group_by(Year, Rating) %>%
  summarise(glob = sum(Global_Sales)) %>%
  ggplot(aes(x = Year, y = glob)) +geom_bar(stat="identity") +
  facet_grid(.~Rating)


#11)

number_eleven <- games %>%
  group_by(Genre) %>%
  summarise(num = n_distinct(Name)) %>%
  arrange(desc(num))
  
number_eleven

#12)
games <- games %>%
  mutate(CU_User = ((User_Score * 10) + Critic_Score)/2)
  

#13)
# Top platform is by how average sale and not the quantity of games
best_platforms <- games %>%
  group_by(Platform) %>%
  summarise(sales_mean = mean(Global_Sales),
            num_of_games = n_distinct(Name))

best <- best_platforms %>%
  top_n(best_platforms$sales_mean, n= 3)
# it's updown tho

#14)

best_platforms_y <- games %>%
  group_by(Platform, Year, add = T) %>%
  summarise(sales_mean = mean(Global_Sales),
            num_of_games = n_distinct(Name))

top_notch <- best_platforms_y %>%
  group_by(Platform) %>%
  filter(Platform %in% best$Platform)

top_notch <- top_notch[complete.cases(top_notch), ]

ggplot(top_notch, aes(x = num_of_games, y = Platform)) + geom_point() +
  facet_wrap(~Year, ncol= 5) + 
  theme(axis.text.x = element_text(size = 10))


