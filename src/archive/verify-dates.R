# Richard Wen
# rrwen.dev@gmail.com
# June 4, 2024
# Get the unique dates from the manually verified install and upgrade dates
# for Nevan Opp <nevanopp@cmail.carleton.ca> to manually clean.
# These dates are unstructured, and thus need to be cleaned into a structured format for analysis.

# Load libaries
library(sf)
library(tidyverse)

# Read data
vancbike_raw <- read_sf("../data/vancouver-bikeways-2024-06-02.geojson")
calgbike_raw <- read_sf("../data/calgary-bikeways-2024-06-05.geojson")
toronbike_raw <- read_sf("../data/toronto-bikeways-2024-06-02.geojson")

# Create list of all data
data_list <- list(
	vancouver = vancbike_raw,
	calgary = calgbike_raw,
	toronto = toronbike_raw
)

# Stack columns and add vars for infra type and city
out <- map(data_list, function (df) {
	df%>%
		as_tibble %>%
		select(
			verify_install_date,
			verify_upgrade1_date,
			verify_upgrade2_date
		) %>%
		pivot_longer(
			cols = everything(),
			names_to = "column",
			values_to = "value"
		) %>%
		filter(!is.na(value)) %>%
		rename(
			verify_date_raw = value
		) %>%
		select(-column)
})

# Combine all cities into single df
out <- out %>%
	reduce(add_row)

# Get unique raw dates, count, and add columns to be filled
out <- out %>%
	group_by(verify_date_raw) %>%
	count() %>%
	rename(
		verify_date_raw_count = n
	) %>%
	arrange(
		desc(verify_date_raw_count)
	) %>%
	mutate(
		verify_date_type = NA,
		verify_date = NA,
		verify_date_start = NA,
		verify_date_end = NA,
		verify_date_prepost = NA
	)

# Write the data to a file
dir.create("../tmp")
write_csv(out, paste0("../tmp/verify-dates-", today(), ".csv"))
	