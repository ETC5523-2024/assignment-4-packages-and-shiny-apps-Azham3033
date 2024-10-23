
# Inside inst/shiny/app.R

library(shiny)
library(tidyverse)

# Load the cleaned coffee survey data from the package
data("coffee_filtered", package = "Coffee")

# Define the UI for the app
ui <- fluidPage(
  titlePanel("Coffee Preferences Explorer"),
  sidebarLayout(
    sidebarPanel(
      selectInput("age_group", "Age Group:", choices = unique(coffee_filtered$age)),
      selectInput("brew_type", "Brew Type:", choices = unique(coffee_filtered$brew))
    ),
    mainPanel(
      tableOutput("coffee_table")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  output$coffee_table <- renderTable({
    coffee_filtered %>%
      filter(age == input$age_group, brew == input$brew_type)
  })
}

# Create and return the Shiny app object
shinyApp(ui = ui, server = server)

