# plot3.R
# This R code generate plot3 of the Project 1 

# Reading the data from text file, replacing missing data '?' with NA

PowerData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")


# Convert Date and Time columns into POSIX formats

PowerData$Date <- as.Date(PowerData$Date, format="%d/%m/%Y")

PowerData$Time <- as.POSIXct(paste(PowerData$Date, PowerData$Time), format="%Y-%m-%d %H:%M:%S")



# Creating a subset of data containing data from 2007-02-01 to 2007-02-02.

subPowerData <- PowerData[PowerData$Date =="2007-02-01" | PowerData$Date =="2007-02-02", ]



# Generating Plot3 on screen first

plot(subPowerData$Time, subPowerData$Sub_metering_1, type="l", col="black", xlab="", 
	ylab="Energy sub metering")

lines(subPowerData$Time, subPowerData$Sub_metering_2, col="red")
lines(subPowerData$Time, subPowerData$Sub_metering_3, col="blue")

# Adding legend

legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1)

# Saving plot3 to png format on local drive

dev.copy(png, file = "./plot3.png", width=480, height=480) 

dev.off() 
