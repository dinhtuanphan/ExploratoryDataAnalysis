# Load the package data.table

library(data.table)

# Read data

power <- fread('household_power_consumption.txt',na.strings = '?')
png("plot2.png", width=480, height=480)

power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

powerTwoDays <- power[(power$dateTime >= '2007-02-01') 
                      & (power$dateTime < '2007-02-03' )]


plot(powerTwoDays$dateTime,powerTwoDays$Global_active_power
     , type = 'l'
     , xlab = ''
     , ylab = 'Global Active Power (Kilowatts')
dev.off()
