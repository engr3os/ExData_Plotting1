## This script makes the plot2 of Exploratory Data Analysis Project 1
## using the refrence data downloaded and uzipped into the working directory

## Point the working directore to the data
setwd("~/ML_R/ExData_Plotting1")

## Upload reaquired packages
library(lubridate)

## Read in the data
hpc <- read.table("household_power_consumption.txt", header = T, sep = ";",
                  na.strings = "?", colClasses = c(rep("character",2), rep("numeric",7)))

## Subset 2-day data of interest
hpc_sub <- subset(hpc, dmy(Date) >= "2007-01-31 UTC" & 
                    dmy(Date) <= "2007-02-02 UTC")

## Combine Date and time
hpc_sub$Date_Time <- dmy_hms(paste(hpc_sub$Date, hpc_sub$Time))

## Plot the data
with(hpc_sub, plot(Date_Time, Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = ""))

## Copy figure into png graphic device 
dev.copy(png, file = "plot2.png")
dev.off()