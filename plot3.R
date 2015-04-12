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
hpc_sub$Date_Time = dmy_hms(paste(hpc_sub$Date, hpc_sub$Time))

## Plot the data
plot(hpc_sub$Date_Time, hpc_sub$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "", col = "black")
lines(hpc_sub$Date_Time, hpc_sub$Sub_metering_2, col="red")
lines(hpc_sub$Date_Time, hpc_sub$Sub_metering_3, col="blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy figure into png graphic device 
dev.copy(png, file = "plot3.png")
dev.off()