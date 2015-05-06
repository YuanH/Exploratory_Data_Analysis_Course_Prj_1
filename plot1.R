library(dplyr)
library(tidyr)
library(magrittr)

setwd("~/Dropbox/R/Exploratory Data Analysis/Course Project 1/")
energy <- read.table('household_power_consumption.txt',sep = ";",header = T)
energy$Date <- as.Date(strptime(energy$Date,"%d/%m/%Y"))

energy %>%
  filter((Date >= "2007-02-01") & (Date <= "2007-02-02"))%>%
  with(hist(as.numeric(Global_active_power), col = "red", xlab = ("Global Active Power (Kilowatts)"),
            main = "Global Active Power"))