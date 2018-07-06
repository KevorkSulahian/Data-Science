video_games <- read.csv("HomeWorks/HomeWork2/Video_Games.csv", stringsAsFactors = F)
#1)
library(dplyr)
library(tidyverse)
games <- video_games %>% 
  select(-c(Publisher, JP_Sales, Critic_Count, User_Count, Developer)) %>%
  mutate(NA_Sales = video_games$NA_Sales * 1000000,
         EU_Sales = video_games$EU_Sales * 1000000,
         Global_Sales = video_games$Global_Sales * 1000000) %>%
  filter(NA_Sales >= 20000, EU_Sales >= 20000) %>%
  filter(str_detect(Rating, "\\w") )
  
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

#4)





