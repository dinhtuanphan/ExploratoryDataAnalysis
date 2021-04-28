# Load the package data.table

library(data.table)

# Read data

power <- fread('household_power_consumption.txt',na.strings = '?')
png("plot1.png", width=480, height=480)
hist(power$Global_active_power, main = 'Global Active Power'
     , xlab = 'Global Active Power (Kilowatts)'
     , ylab = 'Frequency'
     , col = 'Red')
dev.off()