
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Coffee

The **coffee** package provides tools and interactive features to
analyze coffee consumption patterns based on survey data. This package
includes a variety of functions for statistical analysis and an RShiny
app to help users visualize coffee preferences by demographic factors,
such as age group, gender, and favorite coffee type.

Explore coffee preferences interactively using the Shiny app included
with this package, allowing you to filter data and view results in
various visualizations tailored to your preferences.

You can view a comprehensive guide to this package on its
[website](%22https://etc5523-2024.github.io/assignment-4-packages-and-shiny-apps-Azham3033/index.html%22).

**NOTE**: When launching the RShiny app, there may be a short delay as
the app loads the data. Please allow the app approximately 10-20 seconds
to fully initialize, as it loads and processes the coffee survey
dataset.

## Installation

You can install the development version of the **Coffee** package from
GitHub with:

``` r
devtools::install_github("ETC5523-2024/assignment-4-packages-and-shiny-apps-Azham3033")
```

## Shiny App

The `coffee` package also includes an interactive Shiny app for
exploring coffee survey data. To launch the app, use the following
command:

``` r
library(Coffee)
launch_app()
```

The app enables you to:

Filter the data by age group, gender, and favorite coffee type. View
visualizations of coffee preferences segmented by demographics. Discover
trends and insights into coffee consumption patterns.

------------------------------------------------------------------------
