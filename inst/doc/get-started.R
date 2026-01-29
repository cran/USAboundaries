## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(USAboundaries) 

# Check that USAboundariesData is available, since it is not on CRAN.
# And sf as it's not a dependency.
if(all(requireNamespace("USAboundariesData", quietly = TRUE) & requireNamespace("sf", quietly = TRUE))){
  avail = TRUE
} else {
  avail = FALSE
}

# Lookup for state abbr and state codes
state_codes[state_codes$state_abbr == "WI",]

# Returns an sf object
us_states(resolution = "low", states = "WI")

# Returns a PROJ4
state_plane(state = "WI", type = "proj4")

## -----------------------------------------------------------------------------
if (avail) {
  library(sf)
  states_1840 <- us_states("1840-03-12")
  plot(st_geometry(states_1840))
  title("U.S. state boundaries on March 3, 1840")
  
  states_contemporary <- us_states()
  plot(st_geometry(states_contemporary))
  title("Contemporary U.S. state boundaries")
  
  counties_va_1787 <- us_counties("1787-09-17", states = "Virginia")
  plot(st_geometry(counties_va_1787))
  title("County boundaries in Virginia in 1787")
  
  counties_va <- us_counties(states = "Virginia")
  plot(st_geometry(counties_va))
  title("Contemporary county boundaries in Virginia")
  
  counties_va_highres <- us_counties(states = "Virginia", resolution = "high")
  plot(st_geometry(counties_va_highres))
  title("Higher resolution contemporary county boundaries in Virginia")
  
  congress <- us_congressional(states = "California")
  plot(st_geometry(congress))
  title("Congressional district boundaries in California")
}

## -----------------------------------------------------------------------------
if (avail) {
  va <- us_states(states = "VA", resolution = "high")
  plot(st_geometry(va), graticule = TRUE)
  
  va_projection <- state_plane("VA")
  va <- st_transform(va, va_projection)
  plot(st_geometry(va), graticule = TRUE)
}

