% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runapp.R
\name{runApp}
\alias{runApp}
\title{Run Shiny Application}
\usage{
runApp(
  appDir = getwd(),
  port = getOption("shiny.port"),
  launch.browser = getOption("shiny.launch.browser", interactive()),
  host = getOption("shiny.host", "127.0.0.1"),
  workerId = "",
  quiet = FALSE,
  display.mode = c("auto", "normal", "showcase"),
  test.mode = getOption("shiny.testmode", FALSE)
)
}
\arguments{
\item{appDir}{The application to run. Should be one of the following:
\itemize{
\item A directory containing \code{server.R}, plus, either \code{ui.R} or
a \code{www} directory that contains the file \code{index.html}.
\item A directory containing \code{app.R}.
\item An \code{.R} file containing a Shiny application, ending with an
expression that produces a Shiny app object.
\item A list with \code{ui} and \code{server} components.
\item A Shiny app object created by \code{\link[=shinyApp]{shinyApp()}}.
}}

\item{port}{The TCP port that the application should listen on. If the
\code{port} is not specified, and the \code{shiny.port} option is set (with
\code{options(shiny.port = XX)}), then that port will be used. Otherwise,
use a random port between 3000:8000, excluding ports that are blocked
by Google Chrome for being considered unsafe: 3659, 4045, 5060,
5061, 6000, 6566, 6665:6669 and 6697. Up to twenty random
ports will be tried.}

\item{launch.browser}{If true, the system's default web browser will be
launched automatically after the app is started. Defaults to true in
interactive sessions only. The value of this parameter can also be a
function to call with the application's URL.}

\item{host}{The IPv4 address that the application should listen on. Defaults
to the \code{shiny.host} option, if set, or \code{"127.0.0.1"} if not. See
Details.}

\item{workerId}{Can generally be ignored. Exists to help some editions of
Shiny Server Pro route requests to the correct process.}

\item{quiet}{Should Shiny status messages be shown? Defaults to FALSE.}

\item{display.mode}{The mode in which to display the application. If set to
the value \code{"showcase"}, shows application code and metadata from a
\code{DESCRIPTION} file in the application directory alongside the
application. If set to \code{"normal"}, displays the application normally.
Defaults to \code{"auto"}, which displays the application in the mode given
in its \code{DESCRIPTION} file, if any.}

\item{test.mode}{Should the application be launched in test mode? This is
only used for recording or running automated tests. Defaults to the
\code{shiny.testmode} option, or FALSE if the option is not set.}
}
\description{
Runs a Shiny application. This function normally does not return; interrupt R
to stop the application (usually by pressing Ctrl+C or Esc).
}
\details{
The host parameter was introduced in Shiny 0.9.0. Its default value of
\code{"127.0.0.1"} means that, contrary to previous versions of Shiny, only
the current machine can access locally hosted Shiny apps. To allow other
clients to connect, use the value \code{"0.0.0.0"} instead (which was the
value that was hard-coded into Shiny in 0.8.0 and earlier).
}
\examples{
\dontrun{
# Start app in the current working directory
runApp()

# Start app in a subdirectory called myapp
runApp("myapp")
}

## Only run this example in interactive R sessions
if (interactive()) {
  options(device.ask.default = FALSE)

  # Apps can be run without a server.r and ui.r file
  runApp(list(
    ui = bootstrapPage(
      numericInput('n', 'Number of obs', 100),
      plotOutput('plot')
    ),
    server = function(input, output) {
      output$plot <- renderPlot({ hist(runif(input$n)) })
    }
  ))


  # Running a Shiny app object
  app <- shinyApp(
    ui = bootstrapPage(
      numericInput('n', 'Number of obs', 100),
      plotOutput('plot')
    ),
    server = function(input, output) {
      output$plot <- renderPlot({ hist(runif(input$n)) })
    }
  )
  runApp(app)
}
}
