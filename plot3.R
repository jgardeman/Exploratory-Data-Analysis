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
x <- subdata$Datetime
y1 <- subdata$Sub_metering_1
y2 <- subdata$Sub_metering_2
y3 <- subdata$Sub_metering_3
plot(x,y1, type = "l", xlab="", ylab="Energy sub metering")
lines(x,y2, col= "red")
lines(x,y3, col = "blue")
legend("topright", lty-1, lwd=2, col=c("black", "blue", "red"), legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3")
)

## Save to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
