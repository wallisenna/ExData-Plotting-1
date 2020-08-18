setwd("D:/Faculdade/1 MESTRADO/curso de R/curos de grafico/semana 1")

library(readr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
power <- power[ 66638:69518, ]

#transform the variable Global_active_power as numeric
power$Global_active_power<-as.numeric(power$Global_active_power)

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

dev.copy(png, file="plot2.png", height=480, width=480)

with(power, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()
