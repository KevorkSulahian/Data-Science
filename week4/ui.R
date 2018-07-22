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



