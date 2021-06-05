library(shiny)

#UI-----
ui = fluidPage(
  
  titlePanel("CAT Life Prediction Model"),
  
  sidebarLayout(
    sidebarPanel(
      fluidPage(
        numericInput("temp",  label = h3("Temperature"), value = 348.9258),
        hr(),
        #fluidRow(column(12, verbatimTextOutput("value")))
      ),
      fluidPage
      (
        numericInput("feed", label = h3("Feed Sum"), value = 839469242),
        hr(),
        #fluidRow(column(12, verbatimTextOutput("value1")))
      ),
      fluidPage
      (
        numericInput("tsr", label = h3("Use Time"), value = 980),
        hr(),
        #fluidRow(column(12, verbatimTextOutput("value2")))
      )
      
    ),
    mainPanel(
      h4("Factor Table"),
      tableOutput(outputId = "value3"), 
     #,textOutput(outputId = "LF")  )
      h4("Result")
     ,uiOutput("LF") )
    )
  
)
