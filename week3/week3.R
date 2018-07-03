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
