# Inside R/launch_shiny_app.R

#' Launch the Coffee shiny Shiny App
#'
#' This function launches the Shiny app for exploring various coffee preferences across various age group and gender.
#' @export
launch_app <- function() {
  shiny::runApp(system.file("shinyapp", package = "Coffee"))
}


