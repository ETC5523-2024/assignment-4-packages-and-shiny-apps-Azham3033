% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Coffee.R
\name{Coffee-package}
\alias{Coffee-package}
\title{coffee: Analyzing Coffee Consumption Patterns}
\description{
The \strong{Coffee} package provides tools and an interactive RShiny app for analyzing coffee consumption patterns
based on survey data. It includes a variety of functions for statistical analysis and visualization of coffee
preferences segmented by age group, gender, and favorite coffee type.
}
\details{
This package offers both an interactive Shiny app and analytical functions that enable users to explore coffee
preferences interactively, filter data by demographics, and gain insights from visualizations.

You can view a comprehensive guide to this package on its website.

\strong{NOTE}: When launching the RShiny app, please allow approximately 10-20 seconds for the data to load and initialize
due to the dataset size. During this time, the app might appear slow or unresponsive.

The dataset contains various fields, including:
\itemize{
\item \code{id}: Unique identifier for each respondent.
\item \code{age}: Age group of the respondent.
\item \code{cups}: Number of cups of coffee consumed per day.
\item \code{brew}: Preferred brew method.
\item \code{gender}: Gender of the respondent.
\item \code{purchase}: Type of coffee purchase (e.g., in-store or online).
\item \code{total_spend}: Total amount spent on coffee in a month.
\item \code{spent_equipment}: Amount spent on coffee brewing equipment.
\item \code{favorite}: Favorite type of coffee.
}

The app allows you to:
\itemize{
\item Filter by \strong{Age Group} (e.g., "25-34 years old").
\item Filter by \strong{Favorite Coffee Type} (e.g., "Latte", "Espresso").
\item Filter by \strong{Gender} (Male, Female).
}
}
