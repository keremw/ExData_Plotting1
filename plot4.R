#script that does 4 line graphs of from left to right : Global Active Power in kilowatts through time
# The voltage through time
# the Sub_metering power through time
# and The Gllobal Reactive power through time

#script to get data
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"~/Documents/Personal/Coursera/ExploratoryDataEx1/household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip")
household<-read.table("household_power_consumption.txt", sep=";",  header=TRUE)
household<-subset(household, Date=="1/2/2007" | Date=="2/2/2007")


#plot4

par(mfrow=c(2,2))
strtimes<-with(household, paste(Date, Time, sep=" "))
times<-as.POSIXct(strptime(strtimes, '%d/%m/%Y %H:%M:%S')) 
plot(times, as.numeric(as.character(household$Global_active_power)),"l",xlab="", ylab="Global Active Power (kilowatts)") #1st plot
plot(times, as.numeric(as.character(household$Voltage)),"l",xlab="datetime", ylab="Voltage") #2nd plot
plot(times, as.numeric(as.character(household$Sub_metering_1)),"l",xlab="", ylab="Energy sub metering") #3rd plot
lines(times,  as.numeric(as.character(household$Sub_metering_2)), "l", col="red")
lines(times,as.numeric(as.character(household$Sub_metering_3)), "l", col="blue")
legend('topright', c(names(household[7:9])), lty=c(1,1,1), col=c("black", "red", "blue"))
plot(times, as.numeric(as.character(household$Global_reactive_power)),"l",xlab="datetime", ylab="Global_reactive_power") #4th plot
dev.copy(png,file='plot4.png')
dev.off()

