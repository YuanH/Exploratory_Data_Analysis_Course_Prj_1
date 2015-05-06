library(dplyr)
library(tidyr)
library(magrittr)

setwd("~/Dropbox/R/Exploratory Data Analysis/Course Project 1/")
energy <- read.table('household_power_consumption.txt',sep = ";",header = T, 
                     stringsAsFactors = F, na.strings = "?")
energy$Date_Time <- as.POSIXct(strptime(paste(energy$Date,energy$Time), "%d/%m/%Y %H:%M:%S"))

energy_Jul <- energy %>% filter((Date_Time >= "2007-02-01") & (Date_Time < "2007-02-03"))

par(mfrow = c(2,2))
#Plot 1
with(energy_Jul, plot(y = Global_active_power, x = Date_Time, type = "l",
                      ylab = "Global Active Power (Kilowatts)"))

#Plot 2
with(energy_Jul, plot(y = Voltage, x = Date_Time, type = "l",
                      ylab = "Voltage"))

#Plot 3
with(energy_Jul, plot(y = Sub_metering_1 , x = Date_Time, type = "l",  ylab = "Energy sub metering"))
with(energy_Jul, lines(y = Sub_metering_2,  x = Date_Time, col = "red"))
with(energy_Jul, lines(y = Sub_metering_3,  x = Date_Time, col = "blue"))

#Plot 4
with(energy_Jul, plot(y = Global_reactive_power, x = Date_Time, type = "l"))
