##--------------------------------
## shinydashboard: Get started
## tutorial link: http://rstudio.github.io/shinydashboard/get_started.html
##--------------------------------

# install.packages("shinydashboard")

## Basic dashboard with tabs 1
# There are two parst that need to be done. First, add menueItems to the sidebar,
# with appropriate tabNames; Then, in the body, add tabItems with corrsponding 
# values for tabName.
library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "Basic dashboard"),
    ## Sidebar content
    dashboardSidebar(
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
            menuItem("Widgets", tabName = "widgets", icon = icon("th"))
        )
    ),
    ## Body content
    dashboardBody(
        tabItems(
            # First tab content
            tabItem(tabName = "dashboard",
                    fluidRow(
                        box(plotOutput("plot1", height = 250)),
                        
                        box(
                            title = "Controls",
                            sliderInput("slider", "Number of observations:", 1, 100, 50)
                        )
                    )
            ),
            tabItem(tabName = "widgets",
                    h2("Widgets tab content"))
        )
    )
)

server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)