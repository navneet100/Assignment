library("lattice")
setwd("D:\\Documents\\Downloads\\EDA\\Week 2\\Assignment\\ExData_Plotting1")

inputData<-read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses =c("character","character",rep("numeric",7)),na="?")

nrow(inputData)
ncol(inputData)


attach(inputData)
subData <-inputData[Date=="1/2/2007" | Date=="2/2/2007",]

nrow(subData)
ncol(subData)

attach(subData)


datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subData$Global_active_power)
subMeter1 <- as.numeric(subData$Sub_metering_1)
subMeter2 <- as.numeric(subData$Sub_metering_2)
subMeter3 <- as.numeric(subData$Sub_metering_3)

plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png,"plot3.png")
dev.off()
