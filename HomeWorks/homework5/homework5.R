## this is the link
# https://kevorkysulahian.shinyapps.io/homework5/

library(jsonlite)
library(httr)

data18 <- modify_url("https://stats.nba.com/stats/playercompare",
            query = list(PlayerIDList = "2544", VsPlayerIDList = "201939",
                         SeasonType= "Regular Season", MeasureType = "Base",
                         PerMode= "PerGame", PlusMinus = "N",
                         PaceAdjust = "N", Rank = "N", Season = "2017-18",
                         Outcome = "", Location = "", Month = "0",
                         SeasonSegment = '', DateFrom = "", DateTo = "",
                         OpponentTeamID = "0", VsConference  = "",
                         VsDivision = "", GameSegment = "", Period = "0",
                         LastNGames = "0"))


json18 <- '{"resource":"playercompare","parameters":{"MeasureType":"Base","PerMode":"PerGame","PlusMinus":"N","PaceAdjust":"N","Rank":"N","LeagueID":null,"Season":"2017-18","SeasonType":"Regular Season","PlayerIDList":"2544","Outcome":null,"Location":null,"Month":0,"SeasonSegment":null,"DateFrom":null,"DateTo":null,"OpponentTeamID":0,"VsConference":null,"VsDivision":null,"Conference":null,"Division":null,"GameSegment":null,"Period":0,"ShotClockRange":null,"LastNGames":0,"VsPlayerIDList":"201939"},"resultSets":[{"name":"OverallCompare","headers":["GROUP_SET","DESCRIPTION","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","TOV","STL","BLK","BLKA","PF","PFD","PTS","PLUS_MINUS"],"rowSet":[["OVERALL","L. Jamess combined stats",36.9,10.500000,19.300000,0.544,1.800000,5.000000,0.36,4.700000,6.500000,0.723,1.200000,7.500000,8.600000,9.100000,4.200000,1.400000,0.900000,0.800000,1.700000,5.400000,27.500000,1.30000000000000000000000000],["OVERALL","S. Currys combined stats",32.0,8.400000,16.900000,0.497,4.200000,9.800000,0.429,5.500000,5.900000,0.932,0.700000,4.400000,5.100000,6.100000,3.000000,1.600000,0.200000,0.400000,2.200000,4.100000,26.400000,9.50000000000000000000000000]]},{"name":"Individual","headers":["GROUP_SET","DESCRIPTION","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","TOV","STL","BLK","BLKA","PF","PFD","PTS","PLUS_MINUS"],"rowSet":[["INDIVIDUAL","L. James",36.9,10.500000,19.300000,0.542,1.800000,5.000000,0.367,4.700000,6.500000,0.731,1.200000,7.500000,8.600000,9.100000,4.200000,1.400000,0.900000,0.800000,1.700000,5.400000,27.500000,1.30000000000000000000000000],["VS INDIVIDUAL","S. Curry",32.0,8.400000,16.900000,0.495,4.200000,9.800000,0.423,5.500000,5.900000,0.921,0.700000,4.400000,5.100000,6.100000,3.000000,1.600000,0.200000,0.400000,2.200000,4.100000,26.400000,9.50000000000000000000000000]]}]}'


set18 <- fromJSON(json18)


compare18 <- set18[[3]][3][1]
compare_header18 <- set18[[3]][2]


compare_header18 <- compare_header18[1]
compare_header18 <- compare_header18[1,]
compare_header18 <- as.data.frame(compare_header18)
compare_header18 <- t.data.frame(compare_header18)


compare18 <- compare18[,1]
compare18 <- compare18[1]
compare18 <- as.data.frame(compare18)



#### 17

json17 <- '{"resource":"playercompare","parameters":{"MeasureType":"Base","PerMode":"PerGame","PlusMinus":"N","PaceAdjust":"N","Rank":"N","LeagueID":null,"Season":"2016-17","SeasonType":"Regular Season","PlayerIDList":"2544","Outcome":null,"Location":null,"Month":0,"SeasonSegment":null,"DateFrom":null,"DateTo":null,"OpponentTeamID":0,"VsConference":null,"VsDivision":null,"Conference":null,"Division":null,"GameSegment":null,"Period":0,"ShotClockRange":null,"LastNGames":0,"VsPlayerIDList":"201939"},"resultSets":[{"name":"OverallCompare","headers":["GROUP_SET","DESCRIPTION","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","TOV","STL","BLK","BLKA","PF","PFD","PTS","PLUS_MINUS"],"rowSet":[["OVERALL","L. Jamess combined stats",37.8,9.900000,18.200000,0.544,1.700000,4.600000,0.37,4.800000,7.200000,0.667,1.300000,7.300000,8.600000,8.700000,4.100000,1.200000,0.600000,0.800000,1.800000,5.900000,26.400000,6.50000000000000000000000000],["OVERALL","S. Currys combined stats",33.4,8.500000,18.300000,0.464,4.100000,10.000000,0.41,4.100000,4.600000,0.891,0.800000,3.700000,4.500000,6.600000,3.000000,1.800000,0.200000,0.700000,2.300000,3.500000,25.300000,12.80000000000000000000000000]]},{"name":"Individual","headers":["GROUP_SET","DESCRIPTION","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","TOV","STL","BLK","BLKA","PF","PFD","PTS","PLUS_MINUS"],"rowSet":[["INDIVIDUAL","L. James",37.8,9.900000,18.200000,0.548,1.700000,4.600000,0.363,4.800000,7.200000,0.674,1.300000,7.300000,8.600000,8.700000,4.100000,1.200000,0.600000,0.800000,1.800000,5.900000,26.400000,6.50000000000000000000000000],["VS INDIVIDUAL","S. Curry",33.4,8.500000,18.300000,0.468,4.100000,10.000000,0.411,4.100000,4.600000,0.898,0.800000,3.700000,4.500000,6.600000,3.000000,1.800000,0.200000,0.700000,2.300000,3.500000,25.300000,12.80000000000000000000000000]]}]}'

set17 <- fromJSON(json17)


compare17 <- set17[[3]][3][1]
compare_header17 <- set17[[3]][2]


compare_header17 <- compare_header17[1]
compare_header17 <- compare_header17[1,]
compare_header17 <- as.data.frame(compare_header17)
compare_header17 <- t.data.frame(compare_header17)


compare17 <- compare17[,1]
compare17 <- compare17[1]
compare17 <- as.data.frame(compare17)

colnames(compare17) <- compare_header17


#### 16

json16 <- '{"resource":"playercompare","parameters":{"MeasureType":"Base","PerMode":"PerGame","PlusMinus":"N","PaceAdjust":"N","Rank":"N","LeagueID":null,"Season":"2015-16","SeasonType":"Regular Season","PlayerIDList":"2544","Outcome":null,"Location":null,"Month":0,"SeasonSegment":null,"DateFrom":null,"DateTo":null,"OpponentTeamID":0,"VsConference":null,"VsDivision":null,"Conference":null,"Division":null,"GameSegment":null,"Period":0,"ShotClockRange":null,"LastNGames":0,"VsPlayerIDList":"201939"},"resultSets":[{"name":"OverallCompare","headers":["GROUP_SET","DESCRIPTION","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","TOV","STL","BLK","BLKA","PF","PFD","PTS","PLUS_MINUS"],"rowSet":[["OVERALL","L. Jamess combined stats",35.6,9.700000,18.600000,0.522,1.100000,3.700000,0.297,4.700000,6.500000,0.723,1.500000,6.000000,7.400000,6.800000,3.300000,1.400000,0.600000,0.900000,1.900000,5.400000,25.300000,8.10000000000000000000000000],["OVERALL","S. Currys combined stats",34.2,10.200000,20.200000,0.505,5.100000,11.200000,0.455,4.600000,5.100000,0.902,0.900000,4.600000,5.400000,6.700000,3.300000,2.100000,0.200000,0.700000,2.000000,4.500000,30.100000,12.90000000000000000000000000]]},{"name":"Individual","headers":["GROUP_SET","DESCRIPTION","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","TOV","STL","BLK","BLKA","PF","PFD","PTS","PLUS_MINUS"],"rowSet":[["INDIVIDUAL","L. James",35.6,9.700000,18.600000,0.52,1.100000,3.700000,0.309,4.700000,6.500000,0.731,1.500000,6.000000,7.400000,6.800000,3.300000,1.400000,0.600000,0.900000,1.900000,5.400000,25.300000,8.10000000000000000000000000],["VS INDIVIDUAL","S. Curry",34.2,10.200000,20.200000,0.504,5.100000,11.200000,0.454,4.600000,5.100000,0.908,0.900000,4.600000,5.400000,6.700000,3.300000,2.100000,0.200000,0.700000,2.000000,4.500000,30.100000,12.90000000000000000000000000]]}]}'

set16 <- fromJSON(json16)


compare16 <- set16[[3]][3][1]
compare_header16 <- set16[[3]][2]


compare_header16 <- compare_header16[1]
compare_header16 <- compare_header16[1,]
compare_header16 <- as.data.frame(compare_header16)
compare_header16 <- t.data.frame(compare_header16)


compare16 <- compare16[,1]
compare16 <- compare16[1]
compare16 <- as.data.frame(compare16)

colnames(compare16) <- compare_header16

#### 15

json15 <- '{"resource":"playercompare","parameters":{"MeasureType":"Base","PerMode":"PerGame","PlusMinus":"N","PaceAdjust":"N","Rank":"N","LeagueID":null,"Season":"2014-15","SeasonType":"Regular Season","PlayerIDList":"2544","Outcome":null,"Location":null,"Month":0,"SeasonSegment":null,"DateFrom":null,"DateTo":null,"OpponentTeamID":0,"VsConference":null,"VsDivision":null,"Conference":null,"Division":null,"GameSegment":null,"Period":0,"ShotClockRange":null,"LastNGames":0,"VsPlayerIDList":"201939"},"resultSets":[{"name":"OverallCompare","headers":["GROUP_SET","DESCRIPTION","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","TOV","STL","BLK","BLKA","PF","PFD","PTS","PLUS_MINUS"],"rowSet":[["OVERALL","L. Jamess combined stats",36.1,9.000000,18.500000,0.486,1.700000,4.900000,0.347,5.400000,7.700000,0.701,0.700000,5.300000,6.000000,7.400000,3.900000,1.600000,0.700000,0.700000,2.000000,6.000000,25.300000,7.80000000000000000000000000],["OVERALL","S. Currys combined stats",32.7,8.200000,16.800000,0.488,3.600000,8.100000,0.444,3.900000,4.200000,0.929,0.700000,3.600000,4.300000,7.700000,3.100000,2.000000,0.200000,0.500000,2.000000,3.700000,23.800000,11.50000000000000000000000000]]},{"name":"Individual","headers":["GROUP_SET","DESCRIPTION","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","TOV","STL","BLK","BLKA","PF","PFD","PTS","PLUS_MINUS"],"rowSet":[["INDIVIDUAL","L. James",36.1,9.000000,18.500000,0.488,1.700000,4.900000,0.354,5.400000,7.700000,0.71,0.700000,5.300000,6.000000,7.400000,3.900000,1.600000,0.700000,0.700000,2.000000,6.000000,25.300000,7.80000000000000000000000000],["VS INDIVIDUAL","S. Curry",32.7,8.200000,16.800000,0.487,3.600000,8.100000,0.443,3.900000,4.200000,0.914,0.700000,3.600000,4.300000,7.700000,3.100000,2.000000,0.200000,0.500000,2.000000,3.700000,23.800000,11.50000000000000000000000000]]}]}'

set15 <- fromJSON(json15)


compare15 <- set15[[3]][3][1]
compare_header15 <- set15[[3]][2]


compare_header15 <- compare_header15[1]
compare_header15 <- compare_header15[1,]
compare_header15 <- as.data.frame(compare_header15)
compare_header15 <- t.data.frame(compare_header15)


compare15 <- compare15[,1]
compare15 <- compare15[1]
compare15 <- as.data.frame(compare15)

colnames(compare15) <- compare_header15


#### 14

json14 <- '{"resource":"playercompare","parameters":{"MeasureType":"Base","PerMode":"PerGame","PlusMinus":"N","PaceAdjust":"N","Rank":"N","LeagueID":null,"Season":"2013-14","SeasonType":"Regular Season","PlayerIDList":"2544","Outcome":null,"Location":null,"Month":0,"SeasonSegment":null,"DateFrom":null,"DateTo":null,"OpponentTeamID":0,"VsConference":null,"VsDivision":null,"Conference":null,"Division":null,"GameSegment":null,"Period":0,"ShotClockRange":null,"LastNGames":0,"VsPlayerIDList":"201939"},"resultSets":[{"name":"OverallCompare","headers":["GROUP_SET","DESCRIPTION","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","TOV","STL","BLK","BLKA","PF","PFD","PTS","PLUS_MINUS"],"rowSet":[["OVERALL","L. Jamess combined stats",37.7,10.000000,17.600000,0.568,1.500000,4.000000,0.375,5.700000,7.600000,0.75,1.100000,5.900000,6.900000,6.300000,3.500000,1.600000,0.300000,0.500000,1.600000,6.000000,27.100000,5.30000000000000000000000000],["OVERALL","S. Currys combined stats",36.5,8.400000,17.700000,0.475,3.300000,7.900000,0.418,3.900000,4.500000,0.867,0.600000,3.700000,4.300000,8.500000,3.800000,1.600000,0.200000,0.400000,2.500000,4.000000,24.000000,7.30000000000000000000000000]]},{"name":"Individual","headers":["GROUP_SET","DESCRIPTION","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","TOV","STL","BLK","BLKA","PF","PFD","PTS","PLUS_MINUS"],"rowSet":[["INDIVIDUAL","L. James",37.7,10.000000,17.600000,0.567,1.500000,4.000000,0.379,5.700000,7.600000,0.75,1.100000,5.900000,6.900000,6.300000,3.500000,1.600000,0.300000,0.500000,1.600000,6.000000,27.100000,5.30000000000000000000000000],["VS INDIVIDUAL","S. Curry",36.5,8.400000,17.700000,0.471,3.300000,7.900000,0.424,3.900000,4.500000,0.885,0.600000,3.700000,4.300000,8.500000,3.800000,1.600000,0.200000,0.400000,2.500000,4.000000,24.000000,7.30000000000000000000000000]]}]}'

set14 <- fromJSON(json14)


compare14 <- set14[[3]][3][1]
compare_header14 <- set14[[3]][2]


compare_header14 <- compare_header14[1]
compare_header14 <- compare_header14[1,]
compare_header14 <- as.data.frame(compare_header14)
compare_header14 <- t.data.frame(compare_header14)


compare14 <- compare14[,1]
compare14 <- compare14[1]
compare14 <- as.data.frame(compare14)

colnames(compare14) <- compare_header14

compare18 <- as.data.frame(t(compare18))
compare18 <- compare18[-c(1,2),]
colnames(compare18) <- c("Lebron" , "Curry")
compare18$Lebron <- as.numeric(levels(compare18$Lebron))[as.integer(compare18$Lebron)]
compare18$Curry <- as.numeric(levels(compare18$Curry))[as.integer(compare18$Curry)]


compare17 <- as.data.frame(t(compare17))
compare17 <- compare17[-c(1,2),]
colnames(compare17) <- c("Lebron" , "Curry")
compare17$Lebron <- as.numeric(levels(compare17$Lebron))[as.integer(compare17$Lebron)]
compare17$Curry <- as.numeric(levels(compare17$Curry))[as.integer(compare17$Curry)]

compare16 <- as.data.frame(t(compare16))
compare16 <- compare16[-c(1,2),]
colnames(compare16) <- c("Lebron" , "Curry")
compare16$Lebron <- as.numeric(levels(compare16$Lebron))[as.integer(compare16$Lebron)]
compare16$Curry <- as.numeric(levels(compare16$Curry))[as.integer(compare16$Curry)]

compare15 <- as.data.frame(t(compare15))
compare15 <- compare15[-c(1,2),]
colnames(compare15) <- c("Lebron" , "Curry")
compare15$Lebron <- as.numeric(levels(compare15$Lebron))[as.integer(compare15$Lebron)]
compare15$Curry <- as.numeric(levels(compare15$Curry))[as.integer(compare15$Curry)]

compare14 <- as.data.frame(t(compare14))
compare14 <- compare14[-c(1,2),]
colnames(compare14) <- c("Lebron" , "Curry")
compare14$Lebron <- as.numeric(levels(compare14$Lebron))[as.integer(compare14$Lebron)]
compare14$Curry <- as.numeric(levels(compare14$Curry))[as.integer(compare14$Curry)]

compare1 <- cbind(compare14, compare15, compare16, compare17, compare18)

compare1 <- t(compare1)     # transpose the data.frame
compare <- by(compare1, INDICES=row.names(compare1), FUN=colSums) # collapse the rows with the same name
compare <- as.data.frame(do.call(cbind,compare)) # convert by() result to a data.frame

compare$Curry <- compare$Curry /5
compare$Lebron <- compare$Lebron /5
rownames(compare) <- rownames(compare14)

library(ggplot2)



#### here 
library(shinydashboard)


ui<- dashboardPage(
  dashboardHeader(title = "Homework 5"),
  
  dashboardSidebar(
    selectInput(inputId = "df",
                choices = c("compare14", "compare15", "compare16", "compare17", "compare18", "compare"),
                selected = "compare", label = "Select Year"),
    selectInput(inputId = "first", label = "Select player One",
                choices = colnames(compare18),
                selected = "Lebron"),
    selectInput(inputId = "second", label = "Select player Two",
                choices = colnames(compare18),
                selected = "Curry")
  ),
  dashboardBody(
    fluidRow(column(12, plotOutput("bar_first"))),
    fluidRow(column(12, plotOutput("bar_second")))
  ),
  fluidRow(
    
  )
)

server <- function(input, output) {
  
  output$bar_first <- renderPlot({
    ggplot(data = get(input$df), aes(x = rownames(get(input$df)), y = get(input$first),
                                     fill = row.names(get(input$df)))) +
      geom_bar(stat= "identity") +
      labs(title = input$first, x = "Variables", y = "scores", fill = "Variables")
  })
  
  output$bar_second <- renderPlot({
    ggplot(data = get(input$df), aes(x = rownames(get(input$df)), y = get(input$second),
                                     fill =    row.names(get(input$df)))) +
      geom_bar(stat= "identity") +
      labs(title = input$second, x = "Variables", y = "scores", fill = "Variables")
  })
}

shinyApp(ui = ui, server = server)




