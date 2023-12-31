% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/endpoints.R
\name{pub_covid_hosp_state_timeseries}
\alias{pub_covid_hosp_state_timeseries}
\title{COVID Hospitalization Data by State}
\usage{
pub_covid_hosp_state_timeseries(
  states,
  dates,
  ...,
  issues = NULL,
  fetch_args = fetch_args_list()
)
}
\arguments{
\item{states}{character. Two letter state abbreviations.}

\item{dates}{\code{\link{timeset}}. Dates to fetch.}

\item{...}{not used for values, forces later arguments to bind by name}

\item{issues}{\code{\link{timeset}}. Optionally, the issues to fetch. If not set, the
most recent issue is returned.}

\item{fetch_args}{\code{\link{fetch_args}}. Additional arguments to pass to \code{fetch()}.}
}
\value{
\code{\link[tibble:tibble]{tibble::tibble}}
}
\description{
API docs: \url{https://cmu-delphi.github.io/delphi-epidata/api/covid_hosp.html}.

Obtains the COVID-19 reported patient impact and hospital capacity data by
state. This dataset is provided by the US Department of Health & Human
Services.
}
\details{
Starting October 1, 2022, some facilities are only required to
report annually.
}
\examples{
\dontrun{
pub_covid_hosp_state_timeseries(
  states = "fl",
  dates = epirange(20200101, 20200501)
)
}

}
\keyword{endpoint}
