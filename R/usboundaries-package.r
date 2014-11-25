#' USAboundaries: Historical boundaries of the United States of America,
#' 1629-2000
#'
#' This package provides spatial objects with the boundaries of states or
#' counties in the United States of America from 1629 to 2000. It provides data
#' from the \href{http://publications.newberry.org/ahcbp/}{Atlas of Historical
#' County Boundaries}.
#'
#' The copyright to the data used in this package is owned by the Newberry
#' Library, and it is included in this package under the terms of the
#' \href{http://creativecommons.org/licenses/by-nc-sa/2.5/}{Creative Commons
#' Attribution-NonCommercial-ShareAlike 2.5 Generic} (CC BY-NC-SA 2.5) license.
#'
#' @name USAboundaries
#' @docType package
#' @seealso us_boundaries
#' @import assertthat
#' @import dplyr
#' @importFrom ggplot2 fortify
#' @importFrom lubridate ymd
#' @importFrom maptools checkPolygonsHoles
#' @importFrom rgeos createPolygonsComment gUnarySTRtreeQuery gEquals
#'   gContainsProperly gContains
#' @import sp
NULL

# Hide variables from R CMD check
if(getRversion() >= "2.15.1") {
  utils::globalVariables(c("hist_us_states", "hist_us_counties", "id"))
}
