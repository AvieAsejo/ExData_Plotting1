#Reading the file into R
wholedata <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE)

#Formatting the Date column into actual dates
wholedata$Date <- as.Date(wholedata$Date, "%d/%m/%Y")

#Filtering data that are from February 1 to 2, 2007 
filtered <- wholedata[wholedata$Date == as.Date("2007-02-01") | wholedata$Date == as.Date("2007-02-02"),]

#Replacing missing values from "?" to "NA"
sub("?", NA, filtered)


#PLOT 1
#Creating the PNG File
png("plot1.png", width = 480, height = 480)

#Creating the histogram
hist(as.numeric(as.character(filtered$Global_active_power)), main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

#Closing the file
dev.off()

