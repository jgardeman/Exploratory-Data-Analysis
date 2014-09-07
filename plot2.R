## Read in the data
data <- read.csv("power.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Check the class of the Date column and change to the Date class.
class(data$Date)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset only the data from the dates we want to analyze
subdata <- subset(data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates to POSIXct
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## Create time plot
plot(subdata$Datetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Save to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()