##--------------------------------
## shinydashboard: Get started
## tutorial link: http://rstudio.github.io/shinydashboard/get_started.html
##--------------------------------

# install.packages("shinydashboard")

# Basics
# A dashboard has three parts: a heard, a sidebar, and a body. 
## 1. Blank dashboard
# library(shiny)
# library(shinydashboard)
# ui <- dashboardPage(
#     dashboardHeader(),
#     dashboardSidebar(),
#     dashboardBody()
# )
# 
# server <- function(input, output) { }
# 
# shinyApp(ui, server)

## 2. Basic dashboard
library(shinydashboard)
# UI is the face of the app
ui <- dashboardPage(
    dashboardHeader(title = "Basic dashboard"),
    dashboardSidebar(),
    dashboardBody(
        # Boxes need to be put in a row (or column)
        fluidRow(
            box(plotOutput("plot1", height = 250)),
            
            box(
                title = "Controls",
                sliderInput("slider", "Number of observations:", 1, 100, 50)
            )
        )
    )
)
# Server is the brain of the app
server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)
