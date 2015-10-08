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
png(filename = "plot2.png", width = 480, height = 480)
plot(filter_data$DateTime, filter_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()