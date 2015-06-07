# set working dir
#setwd("~/R/Coursera/DataAnalysis/assignment1")

# establish target dates
fromDate <- as.Date("2007-02-01")
toDate <- as.Date("2007-02-02")

# read the data from the input file, subset the data to only those of interest
allData <- read.table ("../data/household_power_consumption.txt", header=T, sep=";", na.strings="?")
myData <- subset(allData, as.Date(allData$Date,"%d/%m/%Y") == fromDate | as.Date(allData$Date,"%d/%m/%Y") == toDate)
myData$dateTime <- as.POSIXlt(paste(as.Date(myData$Date, format="%d/%m/%Y"), myData$Time, sep=" "))

# make the plot
png (filename = "plot2.png")
with (myData, plot (dateTime, Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab = ""))
dev.off()
