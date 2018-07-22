x <- "this is R"
class(x)

x <- "why call language 'smg'"
x
x <- 'dasdsada "asdasd" ?'
x

x <- "asdasda \"aasdasd\" ? "
x

PI <- paste("life of pi", pi)
PI

x <- 1:10
a <-letters[1:10]

k <- paste(x,a)
k

k <- paste(x,a, sep = "WHAT", collapse = ', ')
k

length(k)

nchar(k)

month.name

nchar(month.name)

summer <- read.csv('week3/summer.csv', stringsAsFactors = F)
discipline <- unique(summer$Discipline)
discipline[1:10]

disc_abbr <- abbreviate(discipline, minlength = 5)
disc_abbr[1:10]

x <- "abscda"
substr(x, start = 3, stop = 4)

library(stringr)
str_sub("ABCDEFG", start = 1, end = 3)

str_sub("ABCDEF", start = -3, end = -1)

geners <- c("Action, Adventure, Comedy", "Comedy",
            "Comedy, Drama, Drama, Romance",
            "Crime, Drama, history")

str_detect(string = geners, pattern = "Drama")

str_subset(string = geners, pattern = "Drama")

str_count(string = geners, pattern = "Drama")

movies <- read.csv('week3/movies3.csv', stringsAsFactors = F)

movies$Comedy <- str_detect(string = movies$Genre, pattern = "Comedy")

movies$Romance <- str_detect(string = movies$Genre, pattern = "Romance")

table(Romance = movies$Romance, Comedy = movies$Comedy)

str_split(geners, ",")

gen_m <- str_split(geners, ",", simplify = T)
gen_m

str_replace(geners, pattern = ",", replacement = " &")

str_replace_all(geners, pattern = ",", replacement = " &")


str <- c("123abd", "ab567cd", "abc5.00")
str_subset(string = str, pattern = "\\.")

str_subset(string = str, pattern = "^ab")

str_subset(string = str, pattern = "cd$")

str_subset(string =str, pattern = "[1-5]")

str_subset(string = str, pattern = "[f-z]")

movies$Awards[1:20]

movies$awards_num <- str_replace_all(movies$Awards, pattern = "\\D", replacement = " ")

movies$awards_num[1:20]

movies$awards_num <- str_replace_all(movies$awards_num, pattern = "\\s+", replacement = " ")

movies$awards_num[1:20]

movies$awards_num <- trimws(movies$awards_num)
movies$awards_num[1:20]

x1 <- str_split(movies$awards_num, pattern = " ", simplify = T)
head(x1)

x1 <- apply(x1, MARGIN = 2, as.numeric)
head(x1)

x1 <- rowSums(x1, na.rm = T)
x1[1:20]

movies$awards_num <- x1

ggplot(movies, aes(x=awards_num)) + geom_histogram() +
  xlim(c(0,200)) + labs(title = "Awards histogram (wins and nomination)",
                        x= "Awards", y="Nominations")

m1 <- str_extract_all(movies$Awards, pattern = "[0-9]*\\swin", simplify = T)
m1[1:20]

m1 <- str_remove_all(m1, pattern = "[^0-9]")
m1 <- as.numeric(m1)

movies$Wins <- m1
ggplot(movies, aes(x = Wins)) + geom_histogram() +
  labs(title="Wins histogram", x = "Wins", y= "Count") + 
  xlim(c(0,100))

oscars <- movies %>%
  group_by(title) %>%
  arrange(desc(OscarWon))
head(oscars)

phones <- c("Anna 077-131231", "Hagop 231-123123", "Seroj 123-123123123 malyar")
names <- str_replace_all(phones, pattern = "[^a-zA-Z]", replacement = " ")
names <- str_replace_all(names, pattern = "\\s+", replacement = " ")
names
number <- str_replace_all(phones, pattern = "[^0-9]", replacement = "")
number


### text mining 
library(tm)

text <- c("Dogs are the best pets.","Are these dogs yours?",
        "My dogs are the best dogs")

library(stringr)
text <- str_remove_all(text, pattern = "[:punct:]")
vs <- VectorSource(text)
corpus <- VCorpus(vs)
corpus

corpus[[2]][1]

dtm <- DocumentTermMatrix(corpus)
inspect(dtm)

dtm1 <- DocumentTermMatrix(corpus, control = list(weighting = weightTfIdf))
inspect(dtm1)

lyrics <- read.csv("lyrics.csv", stringsAsFactors = F)
summary(lyrics$year)

library(dplyr)  

lyrics %>%
  group_by(year) %>%
  summarise(count = n()) %>%
  arrange(desc(year))

lyrics <-lyrics %>%
  group_by(year) %>%
  filter(year <= 2016, year >= 1968)

library(ggplot2)

ggplot(data = lyrics, aes(x=genre)) + geom_bar()

lyrics$char_num <- nchar(lyrics$lyrics)
summary(lyrics$char_num)

lyrics <- lyrics %>%
  filter(char_num >100 & genre != "Not Available" & year > 1968 & year <= 2016)
dim(lyrics)

lyrics$lyrics <- iconv(lyrics$lyrics, to= "ASCII", sub = "")

beyonce <- lyrics[lyrics$artist == "beyonce-knowles",]

beyonce_vs <- VectorSource(beyonce$lyrics)
beyonce_corpus <- VCorpus(beyonce_vs)

beyonce_dtm <- TermDocumentMatrix(beyonce_corpus, 
                                  control = list(removeNumbers = T, removePunctuation = T,
                                                 stopwords = T, stemming = T))
beyonce_dtm

dtm_mat <- as.matrix(beyonce_dtm)
freqs <- rowSums(dtm_mat)
df_freqs <- data.frame(terms = rownames(dtm_mat),
                       freq  = freqs, stringsAsFactors = F)
df_freqs <- df_freqs[order(df_freqs$freq, decreasing = T), ]
head(df_freqs)

library(RColorBrewer)

ggplot(df_freqs, aes(x = reorder(terms, freq), y = freq)) +
  geom_bar(stat="identity", fill = brewer.pal(n = 10, name="Spectral")) +
  coord_flip() + labs(x = "Terms", y = "Frequency", title = "top 10 words")

set.seed(1)
library(wordcloud)

wordcloud(words = df_freqs$terms, freq = df_freqs$freq, min.freq = 10, max.words = 200, random.order = FALSE,
          colors = brewer.pal(8, "Dark2"))


### sentiment analysis

library(qdap)

deamplification.words

str <- c("This is a very good class", "I hate coming early in the morning",
         "I deeply love the course, but i hate Sports")

str_df <- data.frame(str, author= c(1:3))
polarity(text.var = str_df$str, grouping.var = str_df$author)
