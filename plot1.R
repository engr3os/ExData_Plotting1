## This script makes the plot1 of Exploratory Data Analysis Project 1
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

## Plot the data
hist(hpc_sub$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

## Copy figure into png graphic device 
dev.copy(png, file = "plot1.png")
dev.off()