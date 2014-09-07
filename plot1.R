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

## Create histogram
hist(subdata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Save to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()