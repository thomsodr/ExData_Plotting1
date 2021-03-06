data<-read.table("household_power_consumption.txt", header=T, sep = ";",
                 stringsAsFactors=F, na.strings="?")

ss<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

lct<-Sys.getlocale("LC_TIME")

library(lubridate)

ad<-paste(ss$Date, ss$Time)
newad<-dmy_hms(ad)


par(mfcol=c(2, 2))
par(cex=.5)
plot(newad, ss$Global_active_power, xlab = "", 
     ylab = "Global Active Power", type = "l")

plot(newad, ss$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "n")
lines(ss$Sub_metering_1~newad)
lines(ss$Sub_metering_2~newad, col='red')
lines(ss$Sub_metering_3~newad, col='blue')

legend(x='topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1, 1, 1), bty="n")

plot(newad, ss$Voltage, xlab = "datetime", 
     ylab = "Voltage", type = "l")

plot(newad, ss$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")

dev.copy(png, file = "plot4.png")
dev.off()

