setwd("D:\\Documents\\Downloads\\EDA\\Week 2\\Assignment\\ExData_Plotting1")

inputData<-read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses =c("character","character",rep("numeric",7)),na="?")

nrow(inputData)
ncol(inputData)


attach(inputData)
subData <-inputData[Date=="1/2/2007" | Date=="2/2/2007",]

nrow(subData)
ncol(subData)

attach(subData)


x <- paste(Date, Time)
subData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(subData) <- 1:nrow(subData)
dim(subData) # 2880   10
attach(subData)

colnames(subData)

hist(Global_active_power, col="red", main="Global_active_power", xlab="Global_active_power (kilowatts)", breaks = 12, ylim = c(0,200))
dev.copy(png,"plot1.png")
dev.off()
