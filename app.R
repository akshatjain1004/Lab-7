#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Scatter plot for iris dataset"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "VarX",label = "Select X axis variable", choices = list("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")),
            selectInput(inputId = "VarY",label = "Select Y axis variable", choices = list("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")),
            selectInput("color1", "color for species setosa:", 
                        choices = c("red", "green", "blue","violet","orange","black"),
                        selected = "gray"),
            selectInput("color2", "color for species versicolor:", 
                        choices = c("red", "green", "blue","violet","orange","black"),
                        selected = "gray"),
            selectInput("color3", "color for species virginica:", 
                        choices = c("red", "green", "blue","violet","orange","black"),
                        selected = "gray"),
            checkboxGroupInput("species", "the species you want to include:",choices = unique(iris$Species),selected = unique(iris$Species)),
            sliderInput("point_size", "point size for setosa:", 
                        min = 1, max = 50, value = 5),
            radioButtons("shape1", "point shape for setosa:", 
                         choices = c("o", "*", "-"),
                         selected = "o"),
            radioButtons("shape2", "point shape for versicolor:", 
                         choices = c("o", "*", "-"),
                         selected = "o"),
            radioButtons("shape3", "point shape for virginica:", 
                         choices = c("o", "*", "-"),
                         selected = "o")
            ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("scatterPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$scatterPlot <- renderPlot({
      filtered <- input$species
      ir<- iris[iris$Species %in% filtered, c(input$VarX,input$VarY)]
      subset <- iris[iris$Species %in% filtered,]
        
        plot(ir[,1],ir[,2],xlab = colnames(ir)[1],ylab = colnames(ir)[2],main = 'scatter plot',col = ifelse(iris$Species == "setosa", input$color1,   ifelse(iris$Species == "versicolor", input$color2,  ifelse(iris$Species == "virginica", input$color3, "gray"))),pch = ifelse(subset$Species == "setosa", input$shape1,   ifelse(subset$Species == "versicolor", input$shape2,  ifelse(subset$Species == "virginica", input$shape3, "o"))),cex = input$point_size)
        

    })
}

# Run the application 
shinyApp(ui = ui, server = server)
