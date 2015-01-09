library(shiny)
library(data.table)
library(dplyr)
library(googleVis)

# More info:
#   https://github.com/jcheng5/googleCharts
# Install:
#   devtools::install_github("jcheng5/googleCharts")
library(googleCharts)

load("healthexp.RData", envir=.GlobalEnv)
