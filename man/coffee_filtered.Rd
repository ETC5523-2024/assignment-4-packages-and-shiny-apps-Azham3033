% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset.R
\docType{data}
\name{coffee_filtered}
\alias{coffee_filtered}
\title{Coffee Survey Filtered Data}
\format{
A data frame with \code{n} rows and the following columns:
\describe{
\item{id}{Unique identifier for each respondent (integer).}
\item{age}{Age group of the respondent as a factor with levels:
\verb{<18 years old}, \verb{18-24 years old}, \verb{25-34 years old}, \verb{35-44 years old},
\verb{45-54 years old}, \verb{55-64 years old}, \verb{>65 years old}.}
\item{cups}{Number of cups of coffee consumed per day (numeric).}
\item{brew}{Preferred brew method of the respondent (character), e.g., "Espresso", "Drip".}
\item{gender}{Gender of the respondent (character), with levels "Male" and "Female".}
\item{purchase}{Type of coffee purchase method (character), such as "in-store" or "online".}
\item{total_spend}{Total amount spent on coffee in a month (numeric), in USD.}
\item{spent_equipment}{Amount spent on coffee brewing equipment (numeric), in USD.}
\item{favorite}{Favorite type of coffee as specified by the respondent (character), e.g., "Latte", "Cappuccino".}
}
}
\source{
The data was collected from a coffee consumption survey.
}
\usage{
coffee_filtered
}
\description{
The \code{coffee_filtered} dataset contains survey data on coffee consumption patterns,
including information on respondents' demographics and coffee preferences.
}
\details{
This dataset can be used to analyze trends in coffee consumption based on variables such as age group,
gender, preferred coffee type, and other relevant factors.
}
\keyword{datasets}
