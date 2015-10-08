# Read the data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert date variables
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Filter data to get only 2007-02-01 and 2007-02-02
filter_data <- subset(data, data$Date >="2007-02-01" & data$Date <="2007-02-02")

#Creates png
png(filename = "plot1.png", width = 480, height = 480)
hist(filter_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()