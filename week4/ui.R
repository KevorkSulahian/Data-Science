#### BUILDING DATA PRODUCTS

library(shiny)
library(ggplot2)

rn <- rnorm(n = 10000, mean = 100, sd = 15)
ggplot() + geom_histogram(aes(x=rn), bins = 50)

shinyApp(ui = ui, server = server)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "mu",
                  label = "Mean for distrubtion:",
                  min = 1, max = 100, value = 50)),
    mainPanel(plotOutput("histogram"))
    ))

server <- function(input,output) {
  output$histogram <- renderPlot({
    rn <- rnorm(n = 10000, mean = input$mu, sd = 15)
    ggplot() + geom_histogram(aes(x=rn), bins = 50)
  })
}



shinyApp(ui = ui, server = server)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "mu",
                  label = "Mean for distrubtion:",
                  min = 1, max = 100, value = 50),
      sliderInput(inputId = "sd",
                  label = "Mean for distrubtion:",
                  min = 5, max = 50, value = 40)),
    mainPanel(plotOutput("histogram"))
  ))

server <- function(input,output) {
  output$histogram <- renderPlot({
    rn <- rnorm(n = 10000, mean = input$mu, sd = input$sd)
    ggplot() + geom_histogram(aes(x=rn), bins = 50)
  })
}

# add calculated median of the vector to the dashborard

shinyApp(ui = ui, server = server)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "mu",
                  label = "Mean for distrubtion:",
                  min = 1, max = 100, value = 50),
      sliderInput(inputId = "sd",
                  label = "Mean for distrubtion:",
                  min = 5, max = 50, value = 40)),
    mainPanel(
      plotOutput("histogram"),
      h3(textOutput("text_median")))
  ))

server <- function(input,output) {
  rn <- reactive({rnorm(n = 10000, mean = input$mu, sd = input$sd)})
  output$histogram <- renderPlot({
    ggplot() + geom_histogram(aes(x=rn), bins = 50)
  })
  
  output$text_median <- renderText({
    paste("Median is,", median(rn()))
  })
}

## start with the movies

movies <- read.csv("week4/movies3.csv", stringsAsFactors = F)
movies_num <- movies[,sapply(movies, is.numeric)]

ui <- fluidPage(
  fluidRow(
    column(4, selectInput(inputId = "first", label = "X axis",
                          choices = colnames(movies_num),
                          selected = "gross_adjusted")),
    column(4, selectInput(inputId = "second", label = "Y axis",
                          choices = colnames(movies_num),
                          selected = "budget_adjusted")),
    column(4, sliderInput(inputId = "alpha",
                          label = "Transparency:",
                          min = 0, max = 1, value = 0.5))
  ),
    fluidRow(
      column(6, plotOutput("scatterplot")),
      column(6, dataTableOutput("summar"))
    )
  )


server <- function(input, output) {
  output$scatterplot <- renderPlot({
    ggplot(data = movies_num, aes_string(x = input$first, y = input$second)) + 
      geom_point(alpha = input$alpha)
  })
  ############################
  output$summary <- renderDataTable({
    movies_num[,c(input$first, input$second)]
  })
  #################
}

shinyApp(ui = ui, server = server)

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








