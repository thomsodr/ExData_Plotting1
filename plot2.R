data<-read.table("household_power_consumption.txt", header=T, sep = ";",
                 stringsAsFactors=F, na.strings="?")

ss<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

lct<-Sys.getlocale("LC_TIME")

library(lubridate)

ad<-paste(ss$Date, ss$Time)
newad<-dmy_hms(ad)

plot(newad, ss$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")

dev.copy(png, file = "plot2.png")
dev.off()




