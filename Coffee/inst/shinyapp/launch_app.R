# Inside R/launch_shiny_app.R

#' Launch the IPL Auction Shiny App
#'
#' This function launches the Shiny app for exploring IPL 2022 player performance data.
#' @export
launch_app <- function() {
  shiny::runApp(system.file("shinyapp", package = "Coffee"))
}


