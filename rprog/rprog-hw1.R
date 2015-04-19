## read dataset
data <- read.csv("data/hw1_data.csv")
colnames <- names(data)
first2rows <- head(data,2)
last2rows <- tail(data,2)
obs <- nrow(data)
ozone47 <- data[["Ozone"]][47]
## ozone47 <- data$Ozone[47]
## ozone47 <- data[47, "Ozone"]
ozoneMissing <- nrow(subset(data, is.na(Ozone)))
##ozoneMissing <- length(data$Ozone[is.na(data$Ozone)])
##ozoneMean <- mean(data$Ozone[complete.cases(data$Ozone)])
ozoneMean <- mean(data$Ozone, na.rm = TRUE)
solarRFilteredMean <- mean(subset(data, Ozone > 31 & Temp > 90)$Solar.R)
tempJuneMean <- mean(subset(data, Month == 6)$Temp)
maxMayOzone <- max(subset(data, Month == 5 & !is.na(Ozone))$Ozone)