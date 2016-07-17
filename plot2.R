#Load dataset
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)

#Convert date
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Subset data where date is 2007-02-02 and 2007-02-01
subdata <- subset(data, data$DateTime >= strptime("2007-02-01", "%Y-%m-%d") & data$DateTime < strptime("2007-02-03", "%Y-%m-%d"))


png(file = "plot2.png", width=480, height=480)
with(subdata, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()