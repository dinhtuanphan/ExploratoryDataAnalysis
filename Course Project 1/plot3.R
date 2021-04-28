# Load the package data.table

library(data.table)

# Read data

power <- fread('household_power_consumption.txt',na.strings = '?')
power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

powerTwoDays <- power[(power$dateTime >= '2007-02-01') 
                      & (power$dateTime < '2007-02-03' )]

png("plot3.png", width=480, height=480)
plot(powerTwoDays$dateTime,powerTwoDays$Sub_metering_1
     , type = 'l'
     , xlab = ''
     , ylab = 'Energy Sub Metering')
lines(powerTwoDays$dateTime,powerTwoDays$Sub_metering_2
      , col = 'red')
lines(powerTwoDays$dateTime,powerTwoDays$Sub_metering_3
      , col = 'blue')
legend('topright'
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
        , lty = c(1,1), lwd = c(1,1)
       
       )
dev.off()

