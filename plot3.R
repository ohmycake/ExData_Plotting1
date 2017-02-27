#Same as plot2#
mydir <- "~/Desktop/Programming/Coursera_DataScience/4"
setwd(mydir)
mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE)
mydt <- subset(mydata, Date %in% c("1/2/2007","2/2/2007"))
mydt$Date <- as.Date(mydt$Date, format = "%d/%m/%Y")
mydt$DtTm <- with(mydt, paste(Date, Time))
mydt$DtTm <- as.POSIXct(mydt$DtTm)

#Start with one line#
plot(mydt$Sub_metering_1 ~ mydt$DtTm, type = "l", ylab = "Energy sub metering", xlab = "")

#Add the second line#
lines(mydt$Sub_metering_2 ~ mydt$DtTm, type = "l", col = "Red")

#Add the third one#
lines(mydt$Sub_metering_3 ~ mydt$DtTm, type = "l", col = "Blue")

#Add legend#
legend('topright', lty = 1, col = c("Black", "Red", "Blue"),
       legend = c("1 Sub_metering_1", "2 Sub_metering_2", "3 Sub_metering_3"))