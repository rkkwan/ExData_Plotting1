#download data
if(!file.exists("./data")) {
  dir.create("./data")
}
if(!file.exists("./data/Electric Power Consumption.zip")) {
  zipURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zipPath <- "./data/Electric Power Consumption.zip"
  download.file(zipURL, zipPath, method = "curl")
  unzip(zipPath, exdir = "./data")
}

#read data
dataLoc <- "./data/household_power_consumption.txt"
data <- read.table(dataLoc, 
                   header=TRUE, 
                   sep=";", 
                   dec=".",
                   stringsAsFactors = FALSE)

##subset data from dates Feb 1, 2007 - Feb 2, 2007
dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#convert data types
dateTimeString <- paste(dataSubset$Date, dataSubset$Time, sep=" ")
dateTime <- strptime(timeString, "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#plot submetering data
png("plot3.png", width=480, height=480)
plot(dateTime, subMetering1, type="l", 
     ylab="Energy sub metering", 
     xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       lwd=2.5, 
       col=c("black", "red", "blue"))
dev.off()







