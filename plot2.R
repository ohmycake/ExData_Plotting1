#Same as plot1#
mydir <- "~/Desktop/Programming/Coursera_DataScience/4"
setwd(mydir)
mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE)
mydt <- subset(mydata, Date %in% c("1/2/2007","2/2/2007"))
mydt$Date <- as.Date(mydt$Date, format = "%d/%m/%Y")

#Convert Time format#
mydt$DtTm <- with(mydt, paste(Date, Time))
mydt$DtTm <- as.POSIXct(mydt$DtTm)

#Make plot#
plot2 <- with(mydt, plot(Global_active_power ~ DtTm, type = "l", 
                         xlab = "", ylab = "Global Active Power (kilowatts)"))
