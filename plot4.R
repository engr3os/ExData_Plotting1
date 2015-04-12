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

## Plot the data to file
png(file = "plot4.png")
par(mfrow = c(2,2),  mar = c(4,4,1,1), oma = c(0, 0, 0, 0))
with(hpc_sub, plot(Date_Time, Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = ""))

with(hpc_sub, plot(Date_Time, Voltage, type = "l",
     ylab = "Voltage", xlab = "datetime"))

with(hpc_sub, {
  plot(Date_Time, Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "", col = "black")
  lines(Date_Time, Sub_metering_2, col="red")
  lines(Date_Time, Sub_metering_3, col="blue")
  legend("topright", lty = "solid", col = c("black", "red", "blue"), cex = 0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
with(hpc_sub, plot(Date_Time, Global_reactive_power, type = "l",
     ylab = "Global_reactive_power", xlab = "datetime"))
dev.off()