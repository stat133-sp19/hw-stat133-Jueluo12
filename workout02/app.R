#title: "workout02"
#author: "Jue Luo"
#date: "4/6/2019"

library(shiny)
library(reshape2)
library(ggplot2)

ui <- fluidPage(

   titlePanel("Saving-Investing Modalities"),
 
   fluidRow (
     column(3,
            sliderInput("initial", h5("Initial Amount"),
                        min = 1, max = 100000, value = 1000, pre = "$")),
     
     column(3,
            sliderInput("return_rate", h5("Return Rate(in %)"),
                       min = 0, max = 20, value = 5)),
     column(3,
            sliderInput("years", h5("Years"),
                       min = 0, max =50, value = 10, pre = "$"))
   ),  
   
   fluidRow (
     column(3,
            sliderInput("annual", h5("Annual Contribution"),
                        min = 0, max = 50000, value = 2000, pre = "$")),
     
     column(3,
            sliderInput("growth_rate", h5("Growth Rate(in %)"),
                        min = 0, max = 20, value = 2)),
     column(3,
            selectInput("facet", h5("Facet?"),
                        choices = list("No" = FALSE, "Yes" = TRUE), selected = 1))
   ),
   titlePanel("Timelines"),
   plotOutput("plot1"),
   titlePanel("Balances"),
   dataTableOutput("table")
)


server <- function(input, output) {
  
  dataInput <- reactive({
    rate <-  input$return_rate/100
    amount <-  input$initial
    years <-  input$years
    contrib <-  input$annual
    growth <-  input$growth_rate/100
    
    future_value <- function(amount, rate, years) {
      result = amount * (1 + rate)^ years 
      return(result)
    }
    annuity <- function(contrib, rate, years) {
      result = contrib * ((1 + rate)^ years -1) / rate
      return(result)
    }
    growing_annuity <- function(contrib, rate, growth, years) {
      result = contrib * ((1 + rate)^ years -(1 + growth)^years) / (rate - growth)
      return(result)
    }
    modalities <- matrix( , ncol = 4, nrow = 11)
    cnames <- c("year", "no_contrib", "fixed_contrib", "growing_contrib")
    colnames(modalities) <- cnames
    for (i in 1:11) {
      modalities[i,1] <- i-1
      modalities[i,2] <- future_value(amount, rate, i-1) 
      modalities[i,3] <- future_value(amount, rate, i-1) + annuity(contrib, rate , i-1)
      modalities[i,4] <- future_value(amount, rate, i-1) + growing_annuity(contrib, rate, growth, i-1)
    }
    modalities <- data.frame(modalities)
  })
  
  
  output$plot1 <- renderPlot({
    plot1.data <- melt(dataInput(),id.vars = "year", variable.name = "Modalities")
    p <- ggplot(plot1.data, aes(year, value, group = Modalities)) +
      geom_line(aes(color = Modalities)) +
      geom_point(aes(color = Modalities)) +
      scale_x_continuous(name = "year", breaks = 0:10) +
      scale_y_continuous(name = "value") + 
      ggtitle("Three modes of investing") +
      theme_bw() 
    if(input$facet ==TRUE) {
      p <- p + facet_grid( ~ Modalities) + geom_area(aes(fill = Modalities))
    }
    p
  })
  
  output$table <- renderDataTable({
    dataInput()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

