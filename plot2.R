library(tidyr)

#Reading the file into R
wholedata <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE)

#Formatting the Date column into actual dates
wholedata$Date <- as.Date(wholedata$Date, "%d/%m/%Y")

#Filtering data that are from February 1 to 2, 2007 
filtered <- wholedata[wholedata$Date == as.Date("2007-02-01") | wholedata$Date == as.Date("2007-02-02"),]

#Replacing missing values from "?" to "NA"
sub("?", NA, filtered)

#Combining date and time columns
datetime <- paste(filtered$Date, filtered$Time)
filtered$DateTime <- strptime(datetime,"%Y-%m-%d %H:%M:%S") 

#PLOT 2

#Creating PNG file
png("plot2.png", width = 480, height = 480)

plot(filtered$DateTime, as.character(filtered$Global_active_power), type = "l", 
     ylab = "Global Active Power (Kilowatts)", xlab = "")

#Closing the file
dev.off()
