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

colnames(subData)

plot(datetime, Global_active_power, type = "l", xlab="", ylab="Global_active_power (kilowatts)")

dev.copy(png,"plot2.png")
dev.off()
