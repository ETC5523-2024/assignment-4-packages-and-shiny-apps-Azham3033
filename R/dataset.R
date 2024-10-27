#' Coffee Survey Filtered Data
#'
#' The `coffee_filtered` dataset contains survey data on coffee consumption patterns,
#' including information on respondents' demographics and coffee preferences.
#'
#' This dataset can be used to analyze trends in coffee consumption based on variables such as age group,
#' gender, preferred coffee type, and other relevant factors.
#'
#' @format A data frame with `n` rows and the following columns:
#' \describe{
#'   \item{id}{Unique identifier for each respondent (integer).}
#'   \item{age}{Age group of the respondent as a factor with levels:
#'              `<18 years old`, `18-24 years old`, `25-34 years old`, `35-44 years old`,
#'              `45-54 years old`, `55-64 years old`, `>65 years old`.}
#'   \item{cups}{Number of cups of coffee consumed per day (numeric).}
#'   \item{brew}{Preferred brew method of the respondent (character), e.g., "Espresso", "Drip".}
#'   \item{gender}{Gender of the respondent (character), with levels "Male" and "Female".}
#'   \item{purchase}{Type of coffee purchase method (character), such as "in-store" or "online".}
#'   \item{total_spend}{Total amount spent on coffee in a month (numeric), in USD.}
#'   \item{spent_equipment}{Amount spent on coffee brewing equipment (numeric), in USD.}
#'   \item{favorite}{Favorite type of coffee as specified by the respondent (character), e.g., "Latte", "Cappuccino".}
#' }
#'
#' @source The data was collected from a coffee consumption survey.
#'
#'
"coffee_filtered"
