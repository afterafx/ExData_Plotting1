powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
subPowerData <- subset(powerData, subset = (Date == "2007-02-01" | Date == "2007-02-02"))
subPowerData$dateTime <- as.POSIXct(paste(subPowerData$Date, subPowerData$Time))

plot(subPowerData$dateTime,subPowerData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subPowerData,lines(dateTime,as.numeric(as.character(Sub_metering_1))))
with(subPowerData,lines(dateTime,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subPowerData,lines(dateTime,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()