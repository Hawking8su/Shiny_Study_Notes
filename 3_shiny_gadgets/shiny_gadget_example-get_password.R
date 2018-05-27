library(miniUI)
library(shiny)

get_password <- function() {
    ui <- miniPage(
        gadgetTitleBar("Please enter your password"), # content in title bar
        miniContentPanel(
            passwordInput("password", "")  # inputId = "password"
            # the default input for passwordInput is input$done, input$cancel, and input$password
        )
    )
    
    server <- function(input, output) {
        observeEvent(input$done, { 
            stopApp(input$password) # exit gadget and return input$password
        })
        observeEvent(input$cancel,{
            stopApp(stop("No password.", call. = FALSE)) 
            # stop execution and return error message: "No password"
        })
    }
    
    runGadget(ui, server, viewer = dialogViewer("Password", height = 200)) # view in dialog
}


# get_password()
