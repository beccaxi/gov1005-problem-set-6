# Question #2: Make a shiny app that takes no input, but simply displays your
# plot from 1G. You’ll want to use plotOutput in your ui section, and
# renderImage in the server piece. Note that for renderImage, you’ll need to
# include a list with the filename (this is also a good place to set the width
# and height of your image).

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Plot from 1G)"),

    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("myImage")
    )
)

# Define server logic required to send a pre-rendered image with renderImage()
server <- function(input, output, session) {
    # Send a pre-rendered image, and don't delete the image after sending it
    output$myImage <- renderImage({
        # When input$n is 3, filename is ./images/image3.jpeg
        filename <- normalizePath(file.path('./ps_6_shiny/dist_plot.png'))
        
        # Return a list containing the filename 
        list(src = filename,
             contentType = 'image/png',
             width = 400,
             height = 300)
        
    }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)
