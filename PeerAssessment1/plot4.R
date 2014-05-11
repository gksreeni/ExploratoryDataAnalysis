#loading the required data
newData <- read.csv2.sql("./household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'")

#extracting the required format for x axis dates
x<-paste(newData$Date, newData$Time)
Dates<-strptime(x, format='%d/%m/%Y %H:%M:%S')

#plotting
png("plot4.png")
par(mfrow=c(2,2))
plot(Dates, newData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(Dates, newData$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(Dates, newData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Dates, newData$Sub_metering_2,col="red")
lines(Dates, newData$Sub_metering_3,col="blue")
legend("topright", text.col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Dates, newData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()