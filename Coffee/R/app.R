#' Coffee Preferences Shiny App
#'
#' This app allows users to explore coffee consumption patterns based on age, gender,
#' and favorite coffee preferences. Users can filter data by age group, gender,
#' and favorite coffee type and visualize the results using bar plots.
#'
#' @import shiny
#' @import tidyverse
#' @import shinythemes
#' @importFrom dplyr filter group_by summarise arrange
#' @importFrom ggplot2 ggplot aes geom_bar geom_text facet_wrap facet_grid labs theme_minimal theme element_text scale_y_continuous
#'
#' @export
#' @name libraries
library(shiny)
library(tidyverse)
library(shinythemes)

# Load the cleaned coffee survey data from the package
data("coffee_filtered", package = "Coffee")

#' Define UI for Coffee Preferences Shiny App
#'
#' This UI includes three inputs for filtering the data: Age Group, Gender, and Favorite Coffee.
#' It outputs two bar plots: one for Age Group distribution by gender and another for Favorite Coffee distribution by age and gender.
#'
#' @return A Shiny UI object
ui <- fluidPage(theme = shinytheme("journal"),
                titlePanel("Coffee Preferences Explorer"),
                shinythemes::themeSelector(),
                sidebarLayout(
                  sidebarPanel(
                    # Input for selecting age group
                    selectInput("age_group", "Age Group:",
                                choices = c("All", levels(coffee_filtered$age))),  # Display the factor levels

                    # Input for selecting gender
                    selectInput("gender", "Gender:",
                                choices = c("All", unique(coffee_filtered$gender))),

                    # Input for selecting favorite coffee
                    selectInput("favorite", "Favorite Coffee:",
                                choices = c("All", unique(coffee_filtered$favorite))),

                    h3("Field Descriptions"),
                    helpText("Descriptions of fields:"),
                    helpText("Age Group: The age category of the respondents."),
                    helpText("Gender: The gender of the respondents (Male or Female)."),
                    helpText("Favorite Coffee: The favorite type of coffee the respondent prefers."),
                    h3("How to Interpret the Outputs"),
                    p("1. **Age Group Distribution by Gender**: This bar plot shows how respondents are distributed across different age groups for each gender.
         The height of each bar represents the count of respondents within that age group. Larger bars indicate more respondents in that category.
         The facet wraps allow you to compare male and female age distributions side-by-side."),
                    p("2. **Favorite Coffee by Age and Gender**: This bar plot displays the count of respondents who prefer different types of coffee, split by gender.
         The height of the bars shows how many respondents prefer each type of coffee. By comparing the male and female facets, you can see differences in coffee preferences between genders.")
                  ),

                  mainPanel(
                    h3("Coffee Consumers by Age and Gender"),
                    plotOutput("age_gender_plot"),  # Output for the first graph

                    h3("Favorite Coffee by Age and Gender"),
                    plotOutput("favorite_plot"), # Output for the second graph
                  )
                )
)

#' Define Server logic for Coffee Preferences Shiny App
#'
#' The server function contains reactive expressions that filter the dataset based on user inputs for
#' age group, gender, and favorite coffee. It outputs two graphs: Age Group Distribution by Gender
#' and Favorite Coffee by Age and Gender.
#'
#' @param input Shiny input object that takes user selections for filters
#' @param output Shiny output object to render plots based on filtered data
#'
#' @return A Shiny server function
#'
server <- function(input, output) {

  #' Reactive expression to filter data based on user inputs
  #'
  #' This reactive function filters the data based on the selected age group, gender,
  #' and favorite coffee. If "All" is selected for any input, the data is not filtered on that parameter.
  #'
  #' @return A filtered data frame
  filtered_data <- reactive({
    data <- coffee_filtered

    # Filter by age group if "All" is not selected
    if (input$age_group != "All") {
      data <- data %>% filter(age == input$age_group)
    }

    # Filter by gender if "All" is not selected
    if (input$gender != "All") {
      data <- data %>% filter(gender == input$gender)
    }

    # Filter by favorite coffee if "All" is not selected
    if (input$favorite != "All") {
      data <- data %>% filter(favorite == input$favorite)
    }

    data
  })

  #' Plot: Age Group Distribution by Gender
  #'
  #' This plot shows the distribution of respondents by age group, with facets for male and female.
  #'
  #' @return A ggplot object showing the count of respondents in each age group for each gender
  output$age_gender_plot <- renderPlot({
    coffee_summary <- filtered_data() %>%
      group_by(age, gender) %>%
      summarise(count = n(), .groups = 'drop') %>%
      arrange(age)

    ggplot(coffee_summary, aes(x = age, y = count, fill = age)) +
      geom_bar(stat = "identity") +
      geom_text(aes(label = count), vjust = -0.5, size = 3) +
      facet_wrap(~ gender) +
      labs(x = "Age Group",
           y = "Count",
           fill = "Age Group") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      scale_y_continuous(breaks = seq(0,1500, by = 250), limits = c(0, 1500))
  })

  #' Plot: Favorite Coffee by Age and Gender
  #'
  #' This plot displays the count of respondents who prefer different coffee types, separated by gender.
  #'
  #' @return A ggplot object showing the count of respondents for each favorite coffee by gender
  output$favorite_plot <- renderPlot({
    # Summarize the data
    favorite_summary <- filtered_data() %>%
      group_by(gender, favorite) %>%
      summarise(count = n(), .groups = 'drop') %>%
      arrange(desc(count))

    # Update favorite names for readability (e.g., blended drink)
    favorite_summary <- favorite_summary %>%
      mutate(favorite = ifelse(favorite == "Blended drink (e.g. Frappuccino)", "Blended drink", favorite))

    ggplot(favorite_summary, aes(x = favorite, y = count, fill = favorite)) +
      geom_bar(stat = "identity", position = "dodge") +
      geom_text(aes(label = count), vjust = -0.5, size = 3) +
      facet_grid(gender ~ .) +
      labs(x = "Favorite Coffee",
           y = "Count",
           fill = "Favorite Coffee") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      scale_y_continuous(breaks = seq(0,1000, by = 200), limits = c(0, 1000))
  })
}

#' Run the Coffee Preferences Shiny App
#'
#' This function launches the Shiny app for exploring coffee consumption patterns.
#' @export
#' @name functioncall
shinyApp(ui = ui, server = server)
