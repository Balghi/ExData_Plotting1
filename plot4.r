# plot4.R
# Read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Convert Date and Time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Subset the data for Feb 1-2, 2007
feb_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Open PNG device
png(filename="plot4.png", width=480, height=480)

# Set up 2x2 plot area
par(mfrow=c(2,2))

# Plot 1: Global Active Power vs DateTime
plot(feb_data$DateTime, feb_data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

# Plot 2: Voltage vs DateTime
plot(feb_data$DateTime, feb_data$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

# Plot 3: Sub-metering vs DateTime
plot(feb_data$DateTime, feb_data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(feb_data$DateTime, feb_data$Sub_metering_2, col="red")
lines(feb_data$DateTime, feb_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty="n")

# Plot 4: Global_reactive_power vs DateTime
plot(feb_data$DateTime, feb_data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

# Close the device
dev.off()