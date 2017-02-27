#Set directory#
mydir <- "~/Desktop/Programming/Coursera_DataScience/4"
setwd(mydir)

#Import data#
mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE)

#Subset#
mydt <- subset(mydata, Date %in% c("1/2/2007","2/2/2007"))

#Convert Date from char to date#
mydt$Date <- as.Date(mydt$Date, format = "%d/%m/%Y")

#Make plot#
plot1 <- with(mydt, hist(Global_active_power, main = "Global Active Power", 
                         xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
                         col = "Red"))