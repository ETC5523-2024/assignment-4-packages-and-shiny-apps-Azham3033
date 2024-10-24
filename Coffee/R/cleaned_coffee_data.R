#' Prepare and Filter Coffee Survey Data
#'
#' This script processes the raw coffee survey data by cleaning, filtering,
#' and restructuring it for analysis. The final dataset, `coffee_filtered`,
#' contains only relevant columns and filters respondents to include only those who have
#' reported their gender as "Male" or "Female." The age column is converted into a factor
#' with ordered levels based on predefined age categories.
#'
#' @details
#' The raw data is first loaded from a CSV file (`coffee_survey.csv`) and a unique `id`
#' is added for each respondent. The relevant columns (`id`, `age`, `cups`, `brew`, `gender`,
#' `purchase`, `total_spend`, `spent_equipment`, and `favorite`) are selected. The data is
#' then filtered to retain only respondents who have indicated their gender as "Male" or "Female."
#' The `age` column is converted into a factor with a predefined order for consistent analysis.
#'
#' The processed dataset, `coffee_filtered`, is saved as an internal dataset using
#' the `usethis::use_data()` function, allowing it to be used within the package.
#'
#' @format The `coffee_filtered` dataset includes the following columns:
#' \describe{
#'   \item{id}{Unique identifier for each respondent.}
#'   \item{age}{Age group of the respondent as a factor with levels: `<18 years old`,
#'              `18-24 years old`, `25-34 years old`, `35-44 years old`, `45-54 years old`,
#'              `55-64 years old`, `>65 years old`.}
#'   \item{cups}{Number of cups of coffee consumed per day.}
#'   \item{brew}{Preferred brew method.}
#'   \item{gender}{Gender of the respondent, either "Male" or "Female".}
#'   \item{purchase}{Type of coffee purchase (e.g., in-store or online).}
#'   \item{total_spend}{Total amount spent on coffee in a month.}
#'   \item{spent_equipment}{Amount spent on coffee brewing equipment.}
#'   \item{favorite}{Favorite type of coffee.}
#' }
#'
#' @source The data was collected from a coffee survey.
#'
#' @examples
#' # The processed dataset `coffee_filtered` is available in the package after running this code:
#' \dontrun{
#' coffee_data <- readr::read_csv("data-raw/coffee_survey.csv")
#'
#' coffee_survey <- coffee_data %>% mutate(id = row_number())
#'
#' coffee_survey_filtered <- coffee_survey %>%
#'   select(id, age, cups, brew, gender, purchase, total_spend, spent_equipment, favorite)
#'
#' coffee_filtered <- coffee_survey_filtered %>%
#'   filter(gender %in% c("Male", "Female"))
#'
#' age_order <- c("<18 years old", "18-24 years old", "25-34 years old", "35-44 years old",
#'                "45-54 years old", "55-64 years old", ">65 years old")
#'
#' coffee_filtered$age <- factor(coffee_filtered$age, levels = age_order)
#'
#' usethis::use_data(coffee_filtered, overwrite = TRUE)
#' }
#'
#' @export
#' @name tidyverse
library(tidyverse)

# Load raw data
coffee_data <- readr::read_csv("data-raw/coffee_survey.csv")

# Add a unique identifier and filter relevant columns
coffee_survey <- coffee_data %>% mutate(id = row_number())
coffee_survey_filtered <- coffee_survey %>% select(id, age, cups, brew, gender, purchase, total_spend, spent_equipment, favorite)

# Filter data to include only Male and Female respondents
coffee_filtered <- coffee_survey_filtered %>%
  filter(gender %in% c("Male", "Female"))

# Define the order for the age factor
age_order <- c("<18 years old", "18-24 years old", "25-34 years old", "35-44 years old", "45-54 years old", "55-64 years old", ">65 years old")

# Convert age to a factor with the defined order
coffee_filtered$age <- factor(coffee_filtered$age, levels = age_order)

# Save the processed data for internal use in the package
usethis::use_data(coffee_filtered, overwrite = TRUE)

