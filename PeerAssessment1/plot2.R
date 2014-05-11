#loading the required data
newData <- read.csv2.sql("./household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'")

#extracting the required format for x axis dates
x<-paste(newData$Date, newData$Time)
Dates<-strptime(x, format='%d/%m/%Y %H:%M:%S')

#plotting plot2.png
png("plot2.png")
plot(Dates, newData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

