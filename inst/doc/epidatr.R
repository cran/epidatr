## ----echo = FALSE, message = FALSE--------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
options(tibble.print_min = 4L, tibble.print_max = 4L, max.print = 4L)

## -----------------------------------------------------------------------------
library(epidatr)
library(dplyr)

# Obtain the most up-to-date version of the smoothed covid-like illness (CLI)
# signal from the COVID-19 Trends and Impact survey for the US
epidata <- pub_covidcast(
  source = "fb-survey",
  signals = "smoothed_cli",
  geo_type = "nation",
  time_type = "day",
  geo_values = "us",
  time_values = epirange(20210105, 20210410)
)
knitr::kable(head(epidata))

## ----eval = FALSE-------------------------------------------------------------
# # Obtain the most up-to-date version of the smoothed covid-like illness (CLI)
# # signal from the COVID-19 Trends and Impact survey for all states
# pub_covidcast(
#   source = "fb-survey",
#   signals = "smoothed_cli",
#   geo_type = "state",
#   time_type = "day",
#   geo_values = "*",
#   time_values = epirange(20210105, 20210410)
# )

## ----eval = FALSE-------------------------------------------------------------
# # Obtain the most up-to-date version of the smoothed covid-like illness (CLI)
# # signal from the COVID-19 Trends and Impact survey for Pennsylvania
# pub_covidcast(
#   source = "fb-survey",
#   signals = "smoothed_cli",
#   geo_type = "state",
#   time_type = "day",
#   geo_values = c("pa", "ca", "fl"),
#   time_values = "*"
# )

## ----eval = FALSE-------------------------------------------------------------
# # Obtain the smoothed covid-like illness (CLI) signal from the COVID-19
# # Trends and Impact survey for Pennsylvania as it was on 2021-06-01
# pub_covidcast(
#   source = "fb-survey",
#   signals = "smoothed_cli",
#   geo_type = "state",
#   time_type = "day",
#   geo_values = "pa",
#   time_values = epirange(20210105, 20210410),
#   as_of = "2021-06-01"
# )

## ----out.height="65%"---------------------------------------------------------
library(ggplot2)
ggplot(epidata, aes(x = time_value, y = value)) +
  geom_line() +
  labs(
    title = "Smoothed CLI from Facebook Survey",
    subtitle = "PA, 2021",
    x = "Date",
    y = "CLI"
  )

## ----class.source = "fold-hide", out.height="65%"-----------------------------
library(maps)

# Obtain the most up-to-date version of the smoothed covid-like illness (CLI)
# signal from the COVID-19 Trends and Impact survey for all states on a single day
cli_states <- pub_covidcast(
  source = "fb-survey",
  signals = "smoothed_cli",
  geo_type = "state",
  time_type = "day",
  geo_values = "*",
  time_values = 20210410
)

# Get a mapping of states to longitude/latitude coordinates
states_map <- map_data("state")

# Convert state abbreviations into state names
cli_states <- mutate(
  cli_states,
  state = ifelse(
    geo_value == "dc",
    "district of columbia",
    state.name[match(geo_value, tolower(state.abb))] %>% tolower()
  )
)

# Add coordinates for each state
cli_states <- left_join(states_map, cli_states, by = c("region" = "state"))

# Plot
ggplot(cli_states, aes(x = long, y = lat, group = group, fill = value)) +
  geom_polygon(colour = "black", linewidth = 0.2) +
  coord_map("polyconic") +
  labs(
    title = "Smoothed CLI from Facebook Survey",
    subtitle = "All states, 2021-04-10",
    x = "Longitude",
    y = "Latitude"
  )

## ----eval = FALSE-------------------------------------------------------------
# avail_endpoints()

## ----echo = FALSE-------------------------------------------------------------
invisible(capture.output(endpts <- avail_endpoints()))
knitr::kable(endpts)

