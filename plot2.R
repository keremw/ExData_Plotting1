#script that does a line graph of the global active power in kilowatts through time

#script to get data
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"~/Documents/Personal/Coursera/ExploratoryDataEx1/household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip")
household<-read.table("household_power_consumption.txt", sep=";",  header=TRUE)
household<-subset(household, Date=="1/2/2007" | Date=="2/2/2007")



#plot2
strtimes<-with(household, paste(Date, Time, sep=" "))
times<-as.POSIXct(strptime(strtimes, '%d/%m/%Y %H:%M:%S')) 
plot(times, as.numeric(as.character(household$Global_active_power)),"l",xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file='plot2.png')
dev.off()
