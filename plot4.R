# read data 
powerAll <- read.table("household_power_consumption.txt", 
                       sep = ";", na.string = "?", header = TRUE)

# select two days ("2007-02-01", "2007-02-02")
powerAll$Date <- as.Date(powerAll$Date, "%d/%m/%Y")
power <- subset(powerAll, Date == as.Date("2007-02-01") | 
                    Date == as.Date("2007-02-02"))

# format date and time 
power$datetime <- paste(power$Date, power$Time)
power$datetime <- strptime(power$datetime, format = "%Y-%m-%d %H:%M:%S")

# define plotting device 
png("plot4.png", width = 480, height = 480)
# plot 
par(mfrow = c(2, 2))
plot(power$datetime, power$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
with(power, plot(datetime, Voltage, type = "l"))
plot(power$datetime, power$Sub_metering_1, type="n", xlab = "", 
     ylab = "Energy sub metering")
lines(power$datetime, power$Sub_metering_1)
lines(power$datetime, power$Sub_metering_2, col = "red")
lines(power$datetime, power$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")
with(power, plot(datetime, Global_reactive_power, type = "l"))
# turn plotting device off 
dev.off()
