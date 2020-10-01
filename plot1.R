# read data 
powerAll <- read.table("household_power_consumption.txt", 
                    sep = ";", na.string = "?", header = TRUE)

# select two days ("2007-02-01", "2007-02-02")
powerAll$Date <- as.Date(powerAll$Date, "%d/%m/%Y")
power <- subset(powerAll, Date == as.Date("2007-02-01") | 
                          Date == as.Date("2007-02-02"))

# define plotting device 
png("plot1.png", width = 480, height = 480)
# plot 
hist(power$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
# turn plotting device off 
dev.off()
