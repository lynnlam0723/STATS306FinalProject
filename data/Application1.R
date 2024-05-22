library(shiny)
library(tidyverse)

#Using results from the previous section, create a shiny application that allows users to interact with the with the IMDb data. 
#The application should use both interactive graphs and at least 3 widgets.

ui <- fluidPage(
  titlePanel("Title Type vs. Runtime Minutes"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("genres_type", "Genres", 
                  choices = unique(title_pivoted$genres)), 
      sliderInput("min_year", "Minimum Year value",
                  value = min(title_pivoted$startYear, na.rm = TRUE),
                  min = min(title_pivoted$startYear, na.rm = TRUE),
                  max = max(title_pivoted$startYear, na.rm = TRUE)),
      sliderInput("max_year", "Maximum Year value", 
                  value = max(title_pivoted$startYear, na.rm = TRUE), 
                  min = min(title_pivoted$startYear, na.rm = TRUE), 
                  max = max(title_pivoted$startYear, na.rm = TRUE))
    ),
    
    mainPanel(
      plotOutput("plot"),
      verbatimTextOutput("info"), 
      tableOutput("runtime_table")
      
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    filtered_data <- title_pivoted[
      title_pivoted$genres %in% input$genres_type &
        title_pivoted$startYear >= input$min_year &
        title_pivoted$startYear <= input$max_year,
    ]
    
    ggplot(data = filtered_data, aes(x = titleType, y = runtimeMinutes)) +
      geom_col() +
      labs(x = "Title Type", y = "Runtime in Minutes")
  })
  
  output$info <- renderPrint({
    req(input$plot_click)
    y <- round(input$plot_click$y, 2)
    cat("[", y, "]", sep = "")
  })
  output$runtime_table <- renderTable({
    filtered_data <- title_pivoted[
      title_pivoted$genres %in% input$genres_type &
        title_pivoted$startYear >= input$min_year &
        title_pivoted$startYear <= input$max_year,
    ]
    runtime_summary <- filtered_data %>%
    group_by(titleType) %>%
    summarize(mean_runtime = mean(runtimeMinutes, na.rm = TRUE))
  
  runtime_summary
  })
  
}

shinyApp(ui = ui, server = server)