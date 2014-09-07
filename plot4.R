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

## Create plots
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(subdata, {
        plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power")
        plot(Voltage~Datetime, type="l", xlab="datetime", ylab="Voltage")
        plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Energy sub metering")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, cex=0.6, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", xlab="datetime", ylab="Global_reactive_power")
})

## Save to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()