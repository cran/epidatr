## ----echo = FALSE, message = FALSE--------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
options(tibble.print_min = 4L, tibble.print_max = 4L, max.print = 4L)
library(epidatr)
library(dplyr)

## ----echo = FALSE-------------------------------------------------------------
suppressMessages(invisible(capture.output(endpts <- avail_endpoints())))
filter(endpts, endsWith(Endpoint, "_meta()")) %>% knitr::kable()

## ----eval = FALSE-------------------------------------------------------------
# avail_endpoints()

## ----echo = FALSE-------------------------------------------------------------
suppressMessages(invisible(capture.output(endpts <- avail_endpoints())))
knitr::kable(endpts)

## -----------------------------------------------------------------------------
covid_sources <- covidcast_epidata()
head(covid_sources$sources, n = 2)

## -----------------------------------------------------------------------------
covid_sources$signals

## -----------------------------------------------------------------------------
covid_sources$signals$`fb-survey:smoothed_cli`

## -----------------------------------------------------------------------------
epidata <- covid_sources$signals$`fb-survey:smoothed_cli`$call(
  "state", "pa", epirange(20210405, 20210410)
)
knitr::kable(epidata)

## -----------------------------------------------------------------------------
pub_covidcast(
  source = "fb-survey",
  signals = "smoothed_accept_covid_vaccine",
  geo_type = "county",
  time_type = "day",
  time_values = epirange(20201221, 20201225),
  geo_values = "06059"
)

## -----------------------------------------------------------------------------
pub_covidcast(
  source = "fb-survey",
  signals = "smoothed_accept_covid_vaccine",
  geo_type = "county",
  time_type = "day",
  time_values = epirange(20201221, 20201225),
  geo_values = "*"
)

## ----eval = FALSE-------------------------------------------------------------
# pub_covid_hosp_facility_lookup(city = "southlake")
# pub_covid_hosp_facility_lookup(state = "WY")
# # A non-example (there is no city called New York in Wyoming)
# pub_covid_hosp_facility_lookup(state = "WY", city = "New York")

## ----eval = FALSE-------------------------------------------------------------
# pub_covid_hosp_facility(
#   hospital_pks = "100075",
#   collection_weeks = epirange(20200101, 20200501)
# )

## ----eval = FALSE-------------------------------------------------------------
# pub_covid_hosp_state_timeseries(states = "MA", dates = "20200510")

## ----eval = FALSE-------------------------------------------------------------
# del <- pub_delphi(system = "ec", epiweek = 201501)
# names(del[[1L]]$forecast)

## ----eval = FALSE-------------------------------------------------------------
# pub_flusurv(locations = "ca", epiweeks = 202001)

## ----eval = FALSE-------------------------------------------------------------
# pub_fluview(regions = "nat", epiweeks = epirange(201201, 202001))

## ----eval = FALSE-------------------------------------------------------------
# pub_fluview_clinical(regions = "nat", epiweeks = epirange(201601, 201701))

## ----eval = FALSE-------------------------------------------------------------
# pub_fluview_meta()

## ----eval = FALSE-------------------------------------------------------------
# pub_gft(locations = "hhs1", epiweeks = epirange(201201, 202001))

## ----eval = FALSE-------------------------------------------------------------
# pub_ecdc_ili(regions = "Armenia", epiweeks = 201840)

## ----eval = FALSE-------------------------------------------------------------
# pub_kcdc_ili(regions = "ROK", epiweeks = 200436)

## ----eval = FALSE-------------------------------------------------------------
# pub_nidss_flu(regions = "taipei", epiweeks = epirange(200901, 201301))

## ----eval = FALSE-------------------------------------------------------------
# pub_nowcast(locations = "ca", epiweeks = epirange(202201, 202319))

## ----eval = FALSE-------------------------------------------------------------
# pub_dengue_nowcast(locations = "pr", epiweeks = epirange(201401, 202301))

## ----eval = FALSE-------------------------------------------------------------
# pub_nidss_dengue(locations = "taipei", epiweeks = epirange(200301, 201301))

## ----eval=FALSE---------------------------------------------------------------
# pub_paho_dengue(regions = "ca", epiweeks = epirange(200201, 202319))

## ----eval = FALSE-------------------------------------------------------------
# pub_wiki(
#   language = "en",
#   articles = "influenza",
#   time_type = "week",
#   time_values = epirange(202001, 202319)
# )

## ----eval=FALSE---------------------------------------------------------------
# pvt_cdc(auth = Sys.getenv("SECRET_API_AUTH_CDC"), epiweeks = epirange(202003, 202304), locations = "ma")

## ----eval=FALSE---------------------------------------------------------------
# pvt_dengue_sensors(
#   auth = Sys.getenv("SECRET_API_AUTH_SENSORS"),
#   names = "ght",
#   locations = "ag",
#   epiweeks = epirange(201404, 202004)
# )

## ----eval=FALSE---------------------------------------------------------------
# pvt_ght(
#   auth = Sys.getenv("SECRET_API_AUTH_GHT"),
#   epiweeks = epirange(199301, 202304),
#   locations = "ma",
#   query = "how to get over the flu"
# )

## ----eval=FALSE---------------------------------------------------------------
# pvt_meta_norostat(auth = Sys.getenv("SECRET_API_AUTH_NOROSTAT"))

## ----eval=FALSE---------------------------------------------------------------
# pvt_norostat(auth = Sys.getenv("SECRET_API_AUTH_NOROSTAT"), locations = "1", epiweeks = 201233)

## ----eval=FALSE---------------------------------------------------------------
# pvt_quidel(auth = Sys.getenv("SECRET_API_AUTH_QUIDEL"), locations = "hhs1", epiweeks = epirange(200301, 202105))

## ----eval=FALSE---------------------------------------------------------------
# pvt_sensors(
#   auth = Sys.getenv("SECRET_API_AUTH_SENSORS"),
#   names = "sar3",
#   locations = "nat",
#   epiweeks = epirange(200301, 202105)
# )

## ----eval=FALSE---------------------------------------------------------------
# pvt_twitter(
#   auth = Sys.getenv("SECRET_API_AUTH_TWITTER"),
#   locations = "nat",
#   time_type = "week",
#   time_values = epirange(200301, 202105)
# )

