# plot1.R
# This R code generate plot1 of the Project 1 

# Reading the data from text file, replacing missing data '?' with NA

PowerData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")


# Convert Date and Time columns into POSIX formats

PowerData$Date <- as.Date(PowerData$Date, format="%d/%m/%Y")

PowerData$Time <- as.POSIXct(paste(PowerData$Date, PowerData$Time), format="%Y-%m-%d %H:%M:%S")


# Creating a subset of data containing data from 2007-02-01 to 2007-02-02.

subPowerData <- PowerData[PowerData$Date =="2007-02-01" | PowerData$Date =="2007-02-02", ]


# Generating Plot1 on screen first

hist(subPowerData$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red")



# Saving plot1 to png format on local drive

dev.copy(png, file = "./plot1.png", width=480, height=480) 

dev.off()  
