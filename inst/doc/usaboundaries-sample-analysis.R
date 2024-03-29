## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE------------------------------------------------------------
library(USAboundaries)
library(dplyr)
library(sf)
library(leaflet)

# Check that USAboundariesData is available, since it is not on CRAN
avail <- requireNamespace("USAboundariesData", quietly = TRUE)

## -----------------------------------------------------------------------------
if (avail) {
  md_votes <- read.csv(system.file("extdata", "md-115.csv",
                                   package = "USAboundaries"),
                       colClasses = c("character", "integer", "character", "integer",
                                      "character", "integer", "integer", "integer",
                                      "integer", "integer", "integer",  "numeric",
                                      "numeric", "numeric", "numeric", "numeric"))
  md_districts <- us_congressional(states = "MD")
}

## -----------------------------------------------------------------------------
if (avail) {
  md_115 <- md_districts %>% 
   left_join(md_votes, by = c("cd116fp" = "district")) 
}

## -----------------------------------------------------------------------------
if (avail) {
  md_115$margin_percent <- md_115$percentage_republican - 0.5
}

## -----------------------------------------------------------------------------
if (avail) {
  palette <- colorBin("RdBu", domain = c(-0.3, 0.3), bins = 7, reverse = TRUE)
}

## -----------------------------------------------------------------------------
if (avail) {
  leaflet(md_115) %>% 
    addTiles() %>% 
    addPolygons(color = "black",
                opacity = 1,
                weight = 1,
                fillColor = ~palette(margin_percent),
                fillOpacity = 1,
                label = ~paste0("District: ", cd116fp))
}

## -----------------------------------------------------------------------------
if (avail) {
  md_03_votes <- read.csv(system.file("extdata", "md-003.csv",
                                      package = "USAboundaries"),
                          stringsAsFactors = FALSE)
  md_03_districts <- us_counties(map_date = "1792-10-01",
                                 resolution = "high", states = "MD")
  md_003 <- md_03_districts %>% 
    left_join(md_03_votes, by = c("id" = "county_ahcb"))
  md_003$margin_percent <- md_003$federalist_percentage - 0.5
}

## -----------------------------------------------------------------------------
if (avail) {
  palette_03 <- colorBin("PRGn", domain = c(-0.5, 0.5), bins = 9)
  leaflet(md_003) %>% 
    addTiles() %>% 
    addPolygons(color = "black",
                opacity = 1,
                weight = 1,
                fillColor = ~palette_03(margin_percent),
                fillOpacity = 1,
                label = ~paste0("County: ", name))
}  

