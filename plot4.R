powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
subPowerData <- subset(powerData, subset = (Date == "2007-02-01" | Date == "2007-02-02"))
subPowerData$dateTime <- as.POSIXct(paste(subPowerData$Date, subPowerData$Time))
globalActivePower <- as.numeric(subPowerData$Global_active_power)

par(mfrow = c(2,2))

plot(subPowerData$dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power")
plot(subPowerData$dateTime, as.numeric(subPowerData$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
plot(subPowerData$dateTime, as.numeric(subPowerData$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(subPowerData$dateTime, as.numeric(subPowerData$Sub_metering_2), type = "l", col = "red")
lines(subPowerData$dateTime, as.numeric(subPowerData$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(subPowerData$dateTime, subPowerData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()