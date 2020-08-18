setwd("D:/Faculdade/1 MESTRADO/curso de R/curos de grafico/semana 1")

library(readr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
power <- power[ 66638:69518, ]

#transform the variable Global_active_power as numeric
power$Global_active_power<-as.numeric(power$Global_active_power)
power$Global_reactive_power<-as.numeric(power$Global_reactive_power)

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

dev.copy(png, file="plot4.png", height=480, width=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(power, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")

        plot(Voltage~Datetime, type="l",
             ylab="Voltage", xlab="datetime")

plot(power$Datetime,power$Sub_metering_1,type="l",col="black", ylab="Energy sub metering"
     ,xlab="")
lines(power$Datetime,power$Sub_metering_2, col="red")
lines(power$Datetime,power$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.75)



        plot(Global_reactive_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})
        

dev.off() 