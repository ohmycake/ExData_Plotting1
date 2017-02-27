#Same as plot2#
mydir <- "~/Desktop/Programming/Coursera_DataScience/4"
setwd(mydir)
mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE)
mydt <- subset(mydata, Date %in% c("1/2/2007","2/2/2007"))
mydt$Date <- as.Date(mydt$Date, format = "%d/%m/%Y")
mydt$DtTm <- with(mydt, paste(Date, Time))
mydt$DtTm <- as.POSIXct(mydt$DtTm)

#Set par to prepare for a 2-by-2 layout#
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#First plot#
plot(mydt$Global_active_power ~ mydt$DtTm, type = "l", xlab = "", ylab = "Global Active Power")

#Second plot#
plot(mydt$Voltage ~ mydt$DtTm, type = "l", xlab = "datetime")

#Third plot#
plot(mydt$Sub_metering_1 ~ mydt$DtTm, type = "l", ylab = "Energy sub metering", xlab = "")
lines(mydt$Sub_metering_2 ~ mydt$DtTm, type = "l", col = "Red")
lines(mydt$Sub_metering_3 ~ mydt$DtTm, type = "l", col = "Blue")
legend("topright", lty = 1, col = c("Black", "Red", "Blue"), lwd = 2, bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Fourth plot#
plot(mydt$Global_reactive_power ~ mydt$DtTm, type = "l", xlab = "datetime")
