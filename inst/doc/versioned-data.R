## ----echo = FALSE, message = FALSE--------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
options(tibble.print_min = 4L, tibble.print_max = 4L, max.print = 4L)
library(epidatr)
library(dplyr)

## -----------------------------------------------------------------------------
epidata <- pub_covidcast(
  source = "doctor-visits",
  signals = "smoothed_adj_cli",
  time_type = "day",
  time_values = epirange("2020-05-01", "2020-05-01"),
  geo_type = "state",
  geo_values = "pa",
  as_of = "2020-05-07"
)
knitr::kable(epidata)

## -----------------------------------------------------------------------------
epidata <- pub_covidcast(
  source = "doctor-visits",
  signals = "smoothed_adj_cli",
  time_type = "day",
  time_values = epirange("2020-05-01", "2020-05-01"),
  geo_type = "state",
  geo_values = "pa"
)
knitr::kable(epidata)

## -----------------------------------------------------------------------------
epidata <- pub_covidcast(
  source = "doctor-visits",
  signals = "smoothed_adj_cli",
  time_type = "day",
  time_values = epirange("2020-05-01", "2020-05-01"),
  geo_type = "state",
  geo_values = "pa",
  issues = epirange("2020-05-01", "2020-05-15")
)
knitr::kable(epidata)

## ----eval = FALSE-------------------------------------------------------------
#  pub_covidcast(
#    source = "doctor-visits",
#    signals = "smoothed_adj_cli",
#    time_type = "day",
#    time_values = epirange("2020-05-01", "2020-05-01"),
#    geo_type = "state",
#    geo_values = "pa",
#    issues = c("2020-05-07", "2020-05-09", "2020-05-15")
#  )

## -----------------------------------------------------------------------------
epidata <- pub_covidcast(
  source = "doctor-visits",
  signals = "smoothed_adj_cli",
  time_type = "day",
  time_values = epirange("2020-05-01", "2020-05-07"),
  geo_type = "state",
  geo_values = "pa",
  lag = 7
)
knitr::kable(epidata)

## -----------------------------------------------------------------------------
epidata <- pub_covidcast(
  source = "doctor-visits",
  signals = "smoothed_adj_cli",
  time_type = "day",
  time_values = epirange("2020-05-03", "2020-05-03"),
  geo_type = "state",
  geo_values = "pa",
  issues = epirange("2020-05-09", "2020-05-15")
)
knitr::kable(epidata)

