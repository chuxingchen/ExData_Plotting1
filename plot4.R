# plot4.R
# This R code generate plot2 of the Project 1 

# Reading the data from text file, replacing missing data '?' with NA

PowerData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")


# Convert Date and Time columns into POSIX formats

PowerData$Date <- as.Date(PowerData$Date, format="%d/%m/%Y")

PowerData$Time <- as.POSIXct(paste(PowerData$Date, PowerData$Time), format="%Y-%m-%d %H:%M:%S")



# Creating a subset of data containing data from 2007-02-01 to 2007-02-02.

subPowerData <- PowerData[PowerData$Date =="2007-02-01" | PowerData$Date =="2007-02-02", ]


# Generating plots on screen first

# Creating 4 panels

dev.copy(png, file = "./plot4.png", width=480, height=480) 

par(mfrow=c(2,2))


# Panel 1

plot(subPowerData$Time, subPowerData$Global_active_power, type="l", xlab="", 
	ylab="Global Active Power(kilowatts)", cex.lab=0.7)


#Panel 2

plot(subPowerData$Time, subPowerData$Voltage, type="l", xlab="datetime",
	ylab="Voltage", cex.lab=0.7)


#panel 3

plot(subPowerData$Time, subPowerData$Sub_metering_1, type="l", col="black", xlab="", 
	ylab="Energy sub metering", cex.lab=0.7)

lines(subPowerData$Time, subPowerData$Sub_metering_2, col="red")
lines(subPowerData$Time, subPowerData$Sub_metering_3, col="blue")

legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1, bty="n", cex=0.7)


#panel 4

plot(subPowerData$Time, subPowerData$Global_active_power, type="l", xlab="datetime", 
	ylab="Voltage", cex.lab=0.7)



# Saving plot4 to png format on local drive

dev.off() 
