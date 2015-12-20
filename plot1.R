# set working dir
#setwd("~/R/Coursera/DataAnalysis/assignment1")

# get the rowsize for 100 rows and use to estimate the size of the table
rowsize <- object.size(read.table ("../data/household_power_consumption.txt", header=T, sep=";", na.strings="?",nrows=100))
rows <- length(readLines("../data/household_power_consumption.txt"))
estimated_size <- rows * rowsize[1] / 100 / 1024/1024

# establish target dates
fromDate <- as.Date("2007-02-01")
toDate <- as.Date("2007-02-02")

# read the data from the input file, subset the data to only those of interest
allData <- read.table ("../data/household_power_consumption.txt", header=T, sep=";", na.strings="?")
myData <- subset(allData, as.Date(allData$Date,"%d/%m/%Y") == fromDate | as.Date(allData$Date,"%d/%m/%Y") == toDate)

# make the plot
png (filename = "plot1.png")
hist(myData[,"Global_active_power"], main = "Global Active Power", col="red",xlab="Global active power (kilowatts)")
dev.off()
 
