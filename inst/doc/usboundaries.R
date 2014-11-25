## ------------------------------------------------------------------------
library(USAboundaries)
library(maptools)
library(sp)
library(ggplot2)

## ----fig.cap="The United States in 1844"---------------------------------
us_1844 <- us_boundaries(as.Date("1844-07-04"))
plot(us_1844)

## ----fig.cap="Counties in Virginia in 1844"------------------------------
va_1844 <- us_boundaries(as.Date("1844-07-04"), states = "Virginia", 
                         type = "county")
plot(va_1844)

## ----fig.cap="United States in 1790"-------------------------------------
us_1790 <- us_boundaries(as.Date("1790-07-04"), format = "df")
ggplot(data = us_1790) +
  geom_map(map = us_1790,
           aes(x = long, y = lat, group = group, map_id = id),
           fill = "white", color = "black", size = 0.2) +
  theme_minimal()

