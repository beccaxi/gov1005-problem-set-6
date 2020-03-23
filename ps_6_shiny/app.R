# Question #2: Make a shiny app that takes no input, but simply displays your
# plot from 1G. You’ll want to use plotOutput in your ui section, and
# renderImage in the server piece. Note that for renderImage, you’ll need to
# include a list with the filename (this is also a good place to set the width
# and height of your image).

library(shiny)

# Define UI for application that displays the plot from 1G
ui <- fluidPage(

    # Application title
    titlePanel("Problem Set 6: Question 2: Plot from 1G)"),

    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("myImage")
    )
)

# Define server logic required to send a pre-rendered image with renderImage()
server <- function(input, output) {
    # Send a pre-rendered image, and don't delete the image after sending it
    output$myImage <- renderImage({
        # Call the png file saved within ps_6_shiny
        filename <- file.path('./dist_plot.png')
        
        # Return a list containing the filename 
        list(src = filename,
             width = 500,
             height = 500)
        
    }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)
