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

#PLOT 4

#Saving graph as png
png("plot4.png", width = 480, height = 480)


par(mfrow = c(2,2), mar = c(4,4,3,2))

#First plot
plot(filtered$DateTime, as.character(filtered$Global_active_power), type = "l", 
     ylab = "Global Active Power", xlab = "")

#Second plot
plot(filtered$DateTime, as.character(filtered$Voltage), type = "l", 
     ylab = "Voltage", xlab = "datetime")

#Third plot
with(filtered, {
  plot(DateTime, as.character(Sub_metering_1), type = "l", 
       ylab = "Energy sub metering", xlab = "")
  points(DateTime, as.character(Sub_metering_2), type = "l", col = "red")
  points(DateTime, as.character(Sub_metering_3), type = "l", col = "blue")
})
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Fourth Plot
plot(filtered$DateTime, as.character(filtered$Global_reactive_power), type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

#Closing the file
dev.off()
