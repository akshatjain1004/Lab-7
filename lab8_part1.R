#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/


library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Histogram Plots for iris dataset "),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          sliderInput("bins","Number of bins:",min = 5,max = 50,value = 30),
          radioButtons("feature", "feature",choices= c("Sepal.Length"=1,"Sepal.Width"=2,"Petal.Length"=3,"Petal.Width"=4)),
          radioButtons("color", "color of histogram", choices=c("Red", "Green", "Yellow", "Blue", "orange", "pink", "darkgrey"), selected = "Green"),
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    property <- as.numeric(input$feature)
    
    bins <- seq(0, max(iris[,property]), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(iris[,property], breaks = bins, col = input$color, border = 'black',
         xlab = names(iris[property]),
         main = paste('Histogram of ', names(iris[property])))})
}

# Run the application 
shinyApp(ui = ui, server = server)
