setwd("D:/Faculdade/1 MESTRADO/curso de R/curos de grafico/semana 1")

library(readr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
power <- power[ 66638:69518, ]

#transform the variable Global_active_power as numeric
power$Global_active_power<-as.numeric(power$Global_active_power)

#plot1 

dev.copy(png, file="plot2.png", height=480, width=480)

hist(power$Global_active_power,col="red", xlab="Globla Active Power (Kilowatts)"
     ,main="Global Active Power")

dev.off()