% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/endpoints.R
\name{pvt_twitter}
\alias{pvt_twitter}
\title{HealthTweets data}
\usage{
pvt_twitter(
  auth,
  locations,
  ...,
  dates = NULL,
  epiweeks = NULL,
  fetch_args = fetch_args_list()
)
}
\arguments{
\item{auth}{string. Restricted access key (not the same as API key).}

\item{locations}{character. Locations to fetch.}

\item{...}{not used for values, forces later arguments to bind by name}

\item{dates}{\code{\link{timeset}}. Dates to fetch. Mutually exclusive with \code{epiweeks}.}

\item{epiweeks}{\code{\link{timeset}}. Epiweeks to fetch. Mutually exclusive with
\code{dates}.}

\item{fetch_args}{\code{\link{fetch_args}}. Additional arguments to pass to \code{fetch()}.}
}
\value{
\code{\link[tibble:tibble]{tibble::tibble}}
}
\description{
API docs: \url{https://cmu-delphi.github.io/delphi-epidata/api/twitter.html}

This is the API documentation for accessing the Twitter Stream (twitter) endpoint of Delphi’s epidemiological data.
Sourced from \href{http://www.healthtweets.org/}{Healthtweets}
}
\examples{
\dontrun{
pvt_twitter(
  auth = Sys.getenv("SECRET_API_AUTH_TWITTER"),
  locations = "CA",
  epiweeks = epirange(201501, 202001)
)
}
}
\keyword{endpoint}
