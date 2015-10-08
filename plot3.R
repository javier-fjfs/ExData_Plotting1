# Read the data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert date variables
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#Filter data to get only 2007-02-01 and 2007-02-02
filter_data <- subset(data, data$Date >="2007-02-01" & data$Date <="2007-02-02")

#New column with date and time
filter_data$DateTime <- paste(filter_data$Date,filter_data$Time)
filter_data$DateTime <- strptime(filter_data$DateTime,format="%Y-%m-%d %H:%M:%S")

#Creates png
png(filename = "plot3.png", width = 480, height = 480)
plot(filter_data$DateTime, filter_data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(filter_data$DateTime, filter_data$Sub_metering_1, type = "l")
points(filter_data$DateTime, filter_data$Sub_metering_2, type = "l", col = "red")
points(filter_data$DateTime, filter_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()