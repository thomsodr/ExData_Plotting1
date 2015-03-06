
data<-read.table("household_power_consumption.txt", header=T, sep = ";",
                 stringsAsFactors=F, na.strings="?")

ss<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

ss$Global_active_power<-as.numeric(ss$Global_active_power)

with(ss, hist(Global_active_power, col="red", main="Global Active Power",
              xlab="Global Active Power (kilowatts)"))

dev.copy(png, file = "plot1.png")
dev.off()