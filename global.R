suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(googleVis))

# More info:
#   https://github.com/jcheng5/googleCharts
# Install:
#   devtools::install_github("jcheng5/googleCharts")
suppressPackageStartupMessages(library(googleCharts))

load("healthexp.RData", envir=.GlobalEnv)
