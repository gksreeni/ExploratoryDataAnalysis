# Download the data zip file from the url

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile="./household_power_consumption.zip", method="curl")

#unzip the file to get the household_power_consumption.txt file
unzip("./household_power_consumption.zip")

#selecting the required dates of data; loading this in newData (since the default sep is ";" in the txtfile, we can use read.csv2.sql to read data)

library(sqldf)

newData <- read.csv2.sql("./household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'")

#plotting the histogram with required labels

png("plot1.png")
hist(newData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()





