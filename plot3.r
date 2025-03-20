# plot3.R
# Read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Convert Date and Time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Subset the data for Feb 1-2, 2007
feb_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Open PNG device
png(filename="plot3.png", width=480, height=480)

# Create line plot for all three sub-metering values
plot(feb_data$DateTime, feb_data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(feb_data$DateTime, feb_data$Sub_metering_2, col="red")
lines(feb_data$DateTime, feb_data$Sub_metering_3, col="blue")

# Add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

# Close the device
dev.off()