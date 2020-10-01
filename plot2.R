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
png("plot2.png", width = 480, height = 480)
# plot 
plot(power$datetime, power$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
# turn plotting device off 
dev.off()
