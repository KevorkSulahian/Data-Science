library(rvest)
library(dplyr)
url <- "https://www.imdb.com/title/tt0299117"

rdodger <- read_html(url) %>%
  html_node(xpath = "//h1") %>%
  html_text()
rdodger
# with xpath
# //*[@id="title-overview-widget"]/div[2]/div[2]/div/div[1]/div[1]/div[1]/strong
# //span
# //strong//span

# without xpath just type 'strong span'

rating <- read_html(url) %>%
  html_node(xpath = '//*[@id="title-overview-widget"]/div[2]/div[2]/div/div[1]/div[1]/div[1]/strong') %>%
  html_text()
rating


read_html(url) %>%
  html_node('strong span') %>%
  html_attrs()

read_html(url) %>%
  html_node('[itemprop=ratingValue]') %>%
  html_text()


cast <- read_html(url) %>%
  html_nodes('#titleCast .itemprop span') %>%
  html_text()
cast

poster <- read_html(url) %>%
  html_node(".poster img") %>%
  html_attr("src")
poster

library(curl)

curl_download(url = poster, destfile = "poster.jpg")

actors_img <- read_html(url) %>%
  html_nodes(".primary_photo img") %>%
  html_attr("loadlate")
actors_img

cast

paste0(cast, ".jpeg")
paste0("actors/",cast,".jpeg")

for(i in 1:length(actors_img)) {
  link = actors_img[i]
  filename = paste0("actors/",cast[i],".jpeg")
  try({
    curl_download(link, destfile = filename, mode = "wb")
  })
}


# read italy
url = "http://www.worldfootball.net/schedule/ita-serie-a-2017-2018-spieltag/38/"

tables <- read_html(url) %>%
  html_table(url, header=F)
View(tables[[2]])


# assignment
# td td td table

url = "http://www.boxofficemojo.com/alltime/weekends/"

ass <- read_html(url) %>%
  html_node("font+ table") %>%
  html_table(url, header = T)
View(ass)

colnames(ass) <- c("Rank", "Title", "Studio", "Opening", "percentage_of_total", "Theaters", "Avg", "Total_Gross", "Date")

class(ass$Opening)
ass$Opening <- gsub("\\$","", ass$Opening)
ass$Opening <- gsub("\\,","", ass$Opening)
ass$Opening <- as.numeric(ass$Opening)
ass$Date <- as.Date(as.character(gsub("\\/","", ass$Date)), "%m%d%Y")

library(ggplot2)

ass$Studio <- as.factor(ass$Studio)

ggplot(ass, aes(x = Studio, y=Opening)) + geom_jitter()

ggplot(ass, aes(x = Date, y = Opening)) + geom_point()



## 2 

second <- read.csv("movies.csv", stringsAsFactors = F)

for(i in 1:length(second[,])) {
  link =   paste0("https://www.imdb.com/title/", second[i,])
  df <- read_html(link) %>%
    html_node(xpath = "//h1") %>%
    html_text()
}

# end of exercise

###

table <- read_html(url) %>%
  html_node(".standard_tabelle") %>%
  html_table(url, header = F)
View(table)

table <- table[,-c(1,2,4,7,8,9)]
head(table)

colnames(table) <- c("Home", "Away", "Score")
table<- as.data.frame(apply(table,2,trimws))
head(table)

library(stringr)
halves <- str_split(table$Score, " ", simplify = T)
halves[1,]

final_s <- str_split(halves[,1], ":", simplify = T)
final_s

final_s <- apply(final_s,2, as.numeric)
final_s

first_half <- str_remove_all(halves[,2], "[\\(\\)]")
first_half

halves1 <- str_replace_all(table$Score, "[\\(\\)]", ":")
halves1 <- str_split(halves1, ":", simplify = T)
halves1

scores <- apply(halves1[,1:4], 2, as.numeric)
colnames(scores) <- c("Home_final", "Away_final", "Home_fh", "Away_fh")

game_38 <- data.frame(table[,1:2], scores)
game_38


### Working with API
library(httr)

request <- GET("https://nflarrest.com/api/v1/crime")
crimes <- content(request)
class(crimes)

crimes <- matrix(unlist(crimes),
                 byrow = T,
                 nrow = 113)
crimes


request <- GET("https://nflarrest.com/api/v1/crime",
               query = list(start_date = "2000-01-31",
                            end_date = "2002-01-31"))
crimes <- content(request)
length(crimes)

url1 <- modify_url("https://nflarrest.com/api/v1/crime", 
                   query = list(start_date = "2000-01-31",
                                end_date = "2002-01-31"))
url1

library(jsonlite)
crimes <- fromJSON(url1)
head(crimes)

crypto <-GET(url = "https://min-api.cryptocompare.com/data/price",
             query = list(fsym = "BTC", 
                          tsyms="USD,EUR"))
content(crypto)

url <- modify_url("https://stats.nba.com/stats/playbyplay",
                  query = list(GameID = "0021600004",
                               StartPeriod = "1",
                               EndPeriod = "10"))
pbp <- readLines(url)

pbp <- fromJSON(pbp)
str(pbp)

pbp_df <- pbp$resultSets$rowSet[[1]]
colnames(pbp_df) <- pbp$resultSets$headers[[1]]

library(quantmod)

getSymbols("AAPL")

apple <- getSymbols("AAPL", env = NULL)
head(AAPL)

plot(AAPL, main="Trade Volume")

getSymbols("TSLA", from = "2016-01-01", to = "2018-01-01")

plot(TSLA)


library(rtweet)
create_token(
  consumer_key = "lTciTYWaknFBeeCOSb2Dk3ErA",
  consumer_secret = "I8QtZ16oqtuCbCITjLtfvBVrFNR4RLoyS5I650EE5ISZaaMyhT",
  access_token = "1847123360-xcxzjm9SB2dYj1nRajwKggha44METiO04xkyZdH",
  access_secret = "pPpdBnK5VecLvUlqNDARAh6kgDArksggWdPrWxZ9Dxqbn")

armenia <- search_tweets("armenia", n = 100, include_rts = F, geocode = "40.171,44.53,100mi", lang="en")
colnames(armenia)
armenia[1:5,"text"]

bc <- search_tweets("bitcoin", n = 500, include_rts = F, 
                    lang = "en", since = "2018-07-21", until = "2018-07-22")
bc[1:5, "text"]







