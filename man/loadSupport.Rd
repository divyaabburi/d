% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shinyapp.R
\name{loadSupport}
\alias{loadSupport}
\title{Load an app's supporting R files}
\usage{
loadSupport(
  appDir = NULL,
  renv = new.env(parent = globalenv()),
  globalrenv = globalenv()
)
}
\arguments{
\item{appDir}{The application directory. If \code{appDir} is \code{NULL} or
not supplied, the nearest enclosing directory that is a Shiny app, starting
with the current directory, is used.}

\item{renv}{The environment in which the files in the \verb{R/} directory should
be evaluated.}

\item{globalrenv}{The environment in which \code{global.R} should be evaluated. If
\code{NULL}, \code{global.R} will not be evaluated at all.}
}
\description{
Loads all of the supporting R files of a Shiny application. Specifically,
this function loads any top-level supporting \code{.R} files in the \verb{R/} directory
adjacent to the \code{app.R}/\code{server.R}/\code{ui.R} files.
}
\details{
Since Shiny 1.5.0, this function is called by default when running an
application. If it causes problems, there are two ways to opt out. You can
either place a file named \verb{_disable_autoload.R} in your R/ directory, or
set \code{options(shiny.autoload.r=FALSE)}. If you set this option, it will
affect any application that runs later in the same R session, potentially
breaking it, so after running your application, you should unset option with
\code{options(shiny.autoload.r=NULL)}

The files are sourced in alphabetical order (as determined by
\link{list.files}). \code{global.R} is evaluated before the supporting R files in the
\verb{R/} directory.
}
