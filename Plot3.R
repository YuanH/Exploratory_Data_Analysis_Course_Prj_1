library(dplyr)
library(tidyr)
library(magrittr)

setwd("~/Dropbox/R/Exploratory Data Analysis/Course Project 1/")
energy <- read.table('household_power_consumption.txt',sep = ";",header = T, 
                     stringsAsFactors = F, na.strings = "?")
energy$Date_Time <- as.POSIXct(strptime(paste(energy$Date,energy$Time), "%d/%m/%Y %H:%M:%S"))

energy_Jul <- energy %>% filter((Date_Time >= "2007-02-01") & (Date_Time < "2007-02-03"))

with(energy_Jul, plot(y = Sub_metering_1 , x = Date_Time, type = "l",  ylab = "Energy sub metering"))
with(energy_Jul, lines(y = Sub_metering_2,  x = Date_Time, col = "red"))
with(energy_Jul, lines(y = Sub_metering_3,  x = Date_Time, col = "blue"))

legend("topright", lty = 1,col = c("black","red","blue"), legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
