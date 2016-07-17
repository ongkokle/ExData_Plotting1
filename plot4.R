#Load dataset
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)

#Convert date
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Subset data where date is 2007-02-02 and 2007-02-01
subdata <- subset(data, data$DateTime >= strptime("2007-02-01", "%Y-%m-%d") & data$DateTime < strptime("2007-02-03", "%Y-%m-%d"))


png(file = "plot4.png", width=480, height=480)

par(mfrow=c(2,2))

with(subdata, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(subdata, plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(subdata, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering", col="black"))
lines(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

with(subdata, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power"))

dev.off()