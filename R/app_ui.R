#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  population = trees::population
  # Leave this function for adding external resources
  golem_add_external_resources()
  # Your application UI logic
  shiny::navbarPage("City of Edmonton",
                    theme = shinythemes::shinytheme("cyborg"),
                    tabPanel("Explore Map", mod_edmonton_ui("edmonton_1")),
                    tabPanel("Compare Neighbourhoods", mod_dashboard_ui("dashboard_1", population)),
                    tabPanel("Find Your Budget", mod_mortgage_ui("mortgage_1")),
                    tabPanel("About", mod_about_ui("about_1"))
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "trees"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
