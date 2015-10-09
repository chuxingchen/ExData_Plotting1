# plot2.R
# This R code generate plot2 of the Project 1 

# Reading the data from text file, replacing missing data '?' with NA

PowerData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")


# Convert Date and Time columns into POSIX formats

PowerData$Date <- as.Date(PowerData$Date, format="%d/%m/%Y")

PowerData$Time <- as.POSIXct(paste(PowerData$Date, PowerData$Time), format="%Y-%m-%d %H:%M:%S")



# Creating a subset of data containing data from 2007-02-01 to 2007-02-02.

subPowerData <- PowerData[PowerData$Date =="2007-02-01" | PowerData$Date =="2007-02-02", ]



# Generating Plot2 on screen first

plot(subPowerData$Time, subPowerData$Global_active_power, type="l", xlab="", 
	ylab="Global Active Power(kilowatts)")


# Saving plot2 to png format on local drive

dev.copy(png, file = "./plot2.png", width=480, height=480) 

dev.off() 
