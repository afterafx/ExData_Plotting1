powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
subPowerData <- subset(powerData, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

hist(as.numeric(subPowerData$Global_active_power), col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()