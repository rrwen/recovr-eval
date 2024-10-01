# Richard Wen
# rrwen.dev@gmail.com
# October 1, 2024
# Nevan Opp <nevanopp@cmail.carleton.ca> discovered verified dates without years.
# This script adds years back into these dates for further cleaning.

# Load libaries
library(sf)
library(tidyverse)

# Read data
calgbike_raw  <- read_sf("../data/archive/calgary-bikeways-2024-10-01.geojson")

# Verified dates with no years
no_year <- c("Sept-Oct", "April-June", "April-May")

# Add years to dates with no years
calgbike <- calgbike_raw %>%
	mutate(
		verify_install_date = if_else(
			verify_install_date %in% no_year,
			paste(verify_install_date, verify_install_year),
			verify_install_date
		),
		verify_upgrade1_date = if_else(
			verify_upgrade1_date %in% no_year,
			paste(verify_upgrade1_date, verify_upgrade1_year),
			verify_upgrade1_date
		),
		verify_upgrade2_date = if_else(
			verify_upgrade2_date %in% no_year,
			paste(verify_upgrade2_date, verify_upgrade2_year),
			verify_upgrade2_date
		)
	)

# Save edited data
calgbike %>% write_sf("../data/calgary-bikeways-2024-10-01.geojson")
