library(dplyr)
library(tidyr)
library(magrittr)

setwd("~/Dropbox/R/Exploratory Data Analysis/Course Project 1/")
energy <- read.table('household_power_consumption.txt',sep = ";",header = T)
energy$Date_Time <- as.POSIXct(strptime(paste(energy$Date,energy$Time), "%d/%m/%Y %H:%M:%S"))

energy$Date<-energy$Date %>% as.character()

energy_Jul <- energy %>% filter((Date_Time >= "2007-02-01") & (Date_Time < "2007-02-03"))

with(energy_Jul, plot(y = Global_active_power, x = Date_Time, type = "l",
                      ylab = "Global Active Power (Kilowatts)"))
