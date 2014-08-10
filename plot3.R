#script that does a line graph of the Sub_metering power through time

#script to get data
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"~/Documents/Personal/Coursera/ExploratoryDataEx1/household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip")
household<-read.table("household_power_consumption.txt", sep=";",  header=TRUE)
household<-subset(household, Date=="1/2/2007" | Date=="2/2/2007")


#plot3

strtimes<-with(household, paste(Date, Time, sep=" "))
times<-as.POSIXct(strptime(strtimes, '%d/%m/%Y %H:%M:%S'), tz='GMT') 
plot(times, as.numeric(as.character(household$Sub_metering_1)),"l",xlab="", ylab="Energy sub metering")
lines(times,  as.numeric(as.character(household$Sub_metering_2)), "l", col="red")
lines(times,as.numeric(as.character(household$Sub_metering_3)), "l", col="blue")
legend('topright', c(names(household[7:9])), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.copy(png,file='plot3.png')
dev.off()
