## ----echo = FALSE, message = FALSE--------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = identical(Sys.getenv("NOT_CRAN"), "true"))

## ----setup, message = FALSE, eval = TRUE--------------------------------------
library(dplyr)
library(ggplot2)
library(epidatr)

## ----meta-example-------------------------------------------------------------
# meta_nssp <- epidata_meta(source = "nssp")
# meta_nssp$nssp$signals
# meta_nssp$nssp$geo_types
# meta_nssp$nssp$version_range
# meta_nssp$nssp$time_value_range

## ----snapshot-example---------------------------------------------------------
# nssp_data <- epidata_snapshot(
#   source = "nssp",
#   signal = "pct_ed_visits_influenza",
#   geo_type = "state"
# )
# head(nssp_data)

## ----dry-run-example----------------------------------------------------------
# dry_run_call <- epidata_snapshot(
#   source = "nssp",
#   signal = "pct_ed_visits_influenza",
#   geo_type = "state",
#   fetch_args = fetch_args_list(dry_run = TRUE)
# )
# dry_run_call

## ----geo-filter---------------------------------------------------------------
# pa_ca_data <- epidata_snapshot(
#   source = "nssp",
#   signal = "pct_ed_visits_influenza",
#   geo_type = "state",
#   geo_values = c("PA", "CA"),
#   as_of = "2025-01-01" # fetch data as it was known on this date
# )
# head(pa_ca_data)

## ----archive-example----------------------------------------------------------
# archive_data <- epidata_archive(
#   source = "nssp",
#   signal = "pct_ed_visits_influenza",
#   geo_type = "state"
# )
# head(archive_data)

## ----other-sources-examples---------------------------------------------------
# # NHSN: Hospital Admissions
# meta_nhsn <- epidata_meta(source = "nhsn")
# meta_nhsn$nhsn$signals
# meta_nhsn$nhsn$geo_types
# meta_nhsn$nhsn$version_range
# meta_nhsn$nhsn$time_value_range
# nhsn_data <- epidata_snapshot(
#   source = "nhsn",
#   signal = "confirmed_admissions_flu_ew",
#   geo_type = "state"
# )
# head(nhsn_data)
# 
# # POPHIVE
# meta_pophive <- epidata_meta(source = "pophive")
# meta_pophive$pophive$signals
# meta_pophive$pophive$geo_types
# meta_pophive$pophive$version_range
# meta_pophive$pophive$time_value_range
# pophive_data <- epidata_snapshot(
#   source = "pophive",
#   signal = "covid_pct_ed",
#   geo_type = "state"
# )
# head(pophive_data)
# 
# # NWSS: Wastewater Surveillance
# meta_nwss <- epidata_meta(source = "nwss")
# meta_nwss$nwss$signals
# meta_nwss$nwss$geo_types
# meta_nwss$nwss$version_range
# meta_nwss$nwss$time_value_range
# nwss_data <- epidata_snapshot(
#   source = "nwss",
#   signal = "covid_avg_conc",
#   geo_type = "sewershed"
# )
# head(nwss_data)

