# movies <- read.csv("week4/movies3.csv", stringsAsFactors = F)
movies <- read.csv("movies3.csv", stringsAsFactors = F)
movies_num <- movies[,sapply(movies, is.numeric)]

library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "This is my dashboard"),
  
  dashboardSidebar(
    sliderInput(inputId = "mu",
                label = "Mean for distribution:",
                min = 1, max = 100, value = 50),
    sliderInput(inputId = "sd",
                label = "Standard deviation for distribution:",
                min = 5, max = 50, value = 40),
    numericInput(inputId = "Sample",
                 label = "Sample size", 
                 min = 100, max = 10000, value = 1000)),
  dashboardBody(plotOutput("histogram"))
)

server <- function(input, output) { }

shinyApp(ui, server)
