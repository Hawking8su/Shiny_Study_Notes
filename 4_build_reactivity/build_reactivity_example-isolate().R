## ---------------------------------------------------------
## Simple example of isolate() and actionButton
## ---------------------------------------------------------

library(shiny)

ui <- pageWithSidebar(
    headerPanel("Click the button"),
    sidebarPanel(
        numericInput("obs", "Number of observations: ", 
                     min = 0, max = 1000, value = 500),
        br(),
        actionButton("goButton", "Go!"),
        p("Click the button to update the value displayed in the main panel.")
    ),
    mainPanel(
        plotOutput("distPlot")
    )
)

server <- function(input, output) {
output$distPlot <- renderPlot({
    # Take a dependency on input$goButton
    input$goButton
    # Use isolate() to avoid dependency on input$obs
    dist <- isolate(rnorm(input$obs))
    hist(dist)
})
 
} 


shinyApp(ui, server)