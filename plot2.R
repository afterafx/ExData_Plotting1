powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
subPowerData <- subset(powerData, subset = (Date == "2007-02-01" | Date == "2007-02-02"))
subPowerData$dateTime <- as.POSIXct(paste(subPowerData$Date, subPowerData$Time))
globalActivePower <- as.numeric(subPowerData$Global_active_power)

plot(subPowerData$dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()