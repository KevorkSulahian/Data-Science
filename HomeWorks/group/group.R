library(httr)
library(jsonlite)

url <- modify_url("https://exchangeratesapi.io/api/latest", query = list(base = "USD"))

req <- fromJSON(url)

data <- content(req)
length(req)

head(data)


#data <- as.data.frame(data)

#rates <- as.data.frame(data[3])


rates <- req[3]
class(rates)

rates <-rates[[1]]
rates





cols <- as.data.frame(rates)


cols <- colnames(cols)
cols




vals <- matrix(unlist(rates), byrow = T)
head(vals)
length(vals)
length(cols)

class(vals)
class(cols)
recent = data.frame(vals, cols)

colnames(recent) <- c("values", "currency")
options(scipen=999)
class(recent$values)


bla <- list(cols, vals)
bla

bla <- as.data.frame(cols, vals)

bla <- matrix(cols, vals)

colnames(bla) <- c("symbol", "rate")
class(bla)

ggplot(recent, aes(x = recent$values, y = recent$currency, fill = recent$values)) + geom_point(stat = "identity") +
  xlim(c(0,10)) + coord_flip()

df <- list(cols, vals)
df

df <- as.data.frame(df)
df

colnames(df) <- c("symbol", "rate")
df

ggplot(df, aes(x = df$symbol, y = df$rate, fill = df$rate)) + geom_bar(stat="identity") +
  coord_cartesian(ylim = c(0, 300)) + theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Latest Rates", x = "Symbol", y = "Rate")

ggplot(df, aes(x = df$symbol, y = df$rate, fill = df$rate)) + geom_point(stat="identity") +
  coord_cartesian(ylim = c(0, 300)) + theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Latest Rates", x = "Symbol", y = "Rate")

eu18 = df[df$symbol == "EUR",]
eu18$symbol = "EUR_18"

## for 2014

req14 <- GET("https://exchangeratesapi.io/api/2014-01-01", query = list(base = "USD"))

data14 <- content(req14)

rates14 <- data14[3]

cols14 <- as.data.frame(rates14)

cols14 <- colnames(cols14)

vals14 <- matrix(unlist(rates14), byrow = T)

df14 <- list(cols14, vals14)

df14 <- as.data.frame(df14)

colnames(df14) <- c("symbol", "rate")

eu14 = df14[df14$symbol == "rates.EUR",]
eu14$symbol = "EUR_14"


### for 2015

req15 <- GET("https://exchangeratesapi.io/api/2015-01-01", query = list(base = "USD"))


data15 <- content(req15)


rates15 <- data15[3]





cols15 <- as.data.frame(rates15)


cols15 <- colnames(cols15)
cols15




vals15 <- matrix(unlist(rates15), byrow = T)

df15 <- list(cols15, vals15)


df15 <- as.data.frame(df15)


colnames(df15) <- c("symbol", "rate")


eu15 = df15[df15$symbol == "rates.EUR",]
eu15$symbol = "EUR_15"
View(eu15)

### for 2016
req16 <- GET("https://exchangeratesapi.io/api/2016-01-01", query = list(base = "USD"))



data16 <- content(req16)


rates16 <- data16[3]





cols16 <- as.data.frame(rates16)


cols16 <- colnames(cols16)
cols16




vals16 <- matrix(unlist(rates16), byrow = T)

df16 <- list(cols16, vals16)


df16 <- as.data.frame(df16)


colnames(df16) <- c("symbol", "rate")


eu16 = df16[df16$symbol == "rates.EUR",]
eu16$symbol = "EUR_16"
View(eu16)

### for 2017
req17 <- GET("https://exchangeratesapi.io/api/2017-01-01", query = list(base = "USD"))




data17 <- content(req17)


rates17 <- data17[3]





cols17 <- as.data.frame(rates17)


cols17 <- colnames(cols17)
cols17




vals17 <- matrix(unlist(rates17), byrow = T)

df17 <- list(cols17, vals17)


df17 <- as.data.frame(df17)


colnames(df17) <- c("symbol", "rate")


eu17 = df17[df17$symbol == "rates.EUR",]
eu17$symbol = "EUR_17"
View(eu17)

class(eu15)
eu14 <- as.list(eu14)
eu15 <- as.list(eu15)
eu16 <- as.list(eu16)
eu17 <- as.list(eu17)
eu18 <- as.list(eu18)

try <- do.call(rbind, Map(data.frame, Symbol = c(eu14$symbol, eu15$symbol, eu16$symbol, eu17$symbol , eu18$symbol),
                          Rate = c(eu14$rate, eu15$rate, eu16$rate, eu17$rate, eu18$rate)))


rownames(try)<- NULL

ggplot(df, aes(x = df$symbol, y = df$rate, fill = df$rate)) + geom_point(stat="identity") +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Latest Rates", x = "Symbol", y = "Rate")

ggplot(try, aes(Rate, y = Symbol)) + geom_point(stat="identity") +
  coord_flip() 



###  
dates <- c()
rates <- list()


for( day in c(1:30)){
  dates <- union(dates, paste("2018-07", day, sep="-"))
}
dates

length(dates)


for(i in c(1:30)){
  req <- GET(paste("https://exchangeratesapi.io/api", dates[i], sep="/"), query = list(base = "USD"))
  data <- content(req)
  data <- as.data.frame(data)
  rates[[i]] <- data$rates.EUR
}


length(rates)

rates

dates <- list(dates)
dates

df <- list(dates, rates)

rates

df

df <- as.data.frame(dates, rates)


colnames(df) <-c("date", "rate")
df


ggplot(df, aes(x = df$date, y = df$rate)) + geom_point(color = "red") +
  theme(axis.text.x = element_blank(),  axis.ticks.x=element_blank()) +
  labs(title = "Rate of EUR based USD for the last month", x = "Month", y = "Rate")
