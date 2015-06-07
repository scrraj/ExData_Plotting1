# set working dir
#setwd("~/R/Coursera/DataAnalysis/assignment1")

# establish target dates
fromDate <- as.Date("2007-02-01")
toDate <- as.Date("2007-02-02")

# read the data from the input file, subset the data to only those of interest
allData <- read.table ("../data/household_power_consumption.txt", header=T, sep=";", na.strings="?")
myData <- subset(allData, as.Date(allData$Date,"%d/%m/%Y") == fromDate | as.Date(allData$Date,"%d/%m/%Y") == toDate)
myData$dateTime <- as.POSIXlt(paste(as.Date(myData$Date, format="%d/%m/%Y"), myData$Time, sep=" "))

png (filename = "plot4.png")

# make the plot
par(mfrow=c(2,2))

#1
with (myData, plot (dateTime, Global_active_power, type="s", ylab="Global active power", xlab=""))

#2
with (myData, plot(dateTime, Voltage, ylab="Voltage", type="l", xlab="datetime", col="black"))

#3
with (myData, plot (dateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
points(myData$dateTime, myData$Sub_metering_1, type="l", col="black")
points(myData$dateTime, myData$Sub_metering_2, type="l", col="red")
points(myData$dateTime, myData$Sub_metering_3, type="l", col="blue")

legend( x="topright", 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black","red","blue"), lwd=1, lty=c(1), bty="n",
        merge=FALSE )

#4
with (myData, plot(dateTime, Global_reactive_power ,xlab="datetime", type="l"))

dev.off()
