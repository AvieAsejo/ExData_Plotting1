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

#Saving graph as png
png("plot2.png", width = 480, height = 480)

with(filtered, {
  plot(DateTime, as.character(Sub_metering_1), type = "l", 
       ylab = "Energy sub metering", xlab = "")
  points(DateTime, as.character(Sub_metering_2), type = "l", col = "red")
  points(DateTime, as.character(Sub_metering_3), type = "l", col = "blue")
})

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Closing the file
dev.off()
