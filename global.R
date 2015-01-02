library(shiny)
library(doBy)
library(data.table)
library(zoo)

load("dataset.RData", envir=.GlobalEnv)

# lifeexp <- read.csv("./cansim1740587989658509557.csv", header=TRUE)
# lifeexp <- lifeexp[,-c(3, 4, 5)]
# colnames(lifeexp) <- c("Year", "Country", "Life.Expectancy")
# # lifeexp[lifeexp=="NA"] <- 0
# 
# healthspend <- read.csv("./cansim2441236631004008246.csv", header=TRUE)
# healthspend <- healthspend[,-c(3, 4)]
# colnames(healthspend) <- c("Year", "Country", "Health.Expenditure")
# 
# population <- read.csv("./cansim4493350466482122204.csv", header=TRUE)
# population <- population[,-c(3, 4)]
# colnames(population) <- c("Year", "Country", "Population")
# 
# dataset <- merge(lifeexp, healthspend, by=c("Year", "Country"))
# 
# dataset <- merge(dataset, population, by=c("Year", "Country"))
# 
# # dataset[is.na(dataset)] <- 0
# # dataset[dataset=="NA"] <- 0
# dataset$Life.Expectancy <- as.numeric(as.character(dataset$Life.Expectancy))
# dataset$Life.Expectancy <- na.approx(dataset$Life.Expectancy, na.rm = FALSE)
# dataset$Health.Expenditure <- as.numeric(as.character(dataset$Health.Expenditure))
# dataset$Year <- as.numeric(as.character(dataset$Year))
# dataset$Region <- "Canada"
# dataset$Region <- as.factor(dataset$Region)
# 
# data <- dataset[c(2, 3, 4, 6, 5, 1)]
# 
# rm(lifeexp, healthspend, population, dataset)
# 
# data$CountryCode[data$Country == 'Alberta'] <- 'AB'
# data$CountryCode[data$Country == 'British Columbia'] <- 'BC'
# data$CountryCode[data$Country == 'Manitoba'] <- 'MB'
# 
# data$CountryCode[data$Country == 'New Brunswick'] <- 'NB'
# data$CountryCode[data$Country == 'Newfoundland and Labrador'] <- 'NL'
# data$CountryCode[data$Country == 'Northwest Territories'] <- 'NT'
# data$CountryCode[data$Country == 'Nova Scotia'] <- 'NS'
# data$CountryCode[data$Country == 'Nunavut'] <- 'NU'
# data$CountryCode[data$Country == 'Ontario'] <- 'ON'
# data$CountryCode[data$Country == 'Prince Edward Island'] <- 'PE'
# data$CountryCode[data$Country == 'Quebec'] <- 'QC'
# data$CountryCode[data$Country == 'Saskatchewan'] <- 'SK'
# data$CountryCode[data$Country == 'Yukon'] <- 'YT'
# 
# #data$CountryName <- as.factor(data$Country)
# data$Country <- as.factor(data$CountryCode)
# 
# data <- data[,-c(7)]
# data$Health.Expenditure <- data$Health.Expenditure / data$Population * 1000000