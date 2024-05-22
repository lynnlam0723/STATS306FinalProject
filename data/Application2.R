library(tidyverse)
library(lubridate)
library(shiny)

#In the principals table, there is a `category` column. 
#Use this column as a primary filter to allow users to then select specific job categories. 
#After select the specific job categories, display information from another table.

ui <- fluidPage(
  titlePanel("Job Category"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("category", "Select Job Category", 
                  choices = unique(title_principals$category)),
      uiOutput("job_category")
    ),
    
    mainPanel(
      tableOutput("knownFor_info")
    )
  )
)

server <- function(input, output) {
  output$knownFor_info <- renderTable({
    filtered_data <- title_principals[title_principals$category == input$category, ]
    nconsts <- filtered_data$nconst
    match_data <- name_basics[name_basics$nconst %in% nconsts, ]
    match_data$numTitles <- sapply(strsplit(match_data$knownForTitles, ","), length)
    result <- match_data |>
      select(primaryName, numTitles)
    result
  })
  
}

shinyApp(ui = ui, server = server)


