#script that does a histogram of the global active power in kilowatts

#script to get data
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"~/Documents/Personal/Coursera/ExploratoryDataEx1/household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip")
household<-read.table("household_power_consumption.txt", sep=";",  header=TRUE)
household<-subset(household, Date=="1/2/2007" | Date=="2/2/2007")

#plot1
hist(as.numeric(as.character(household$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,file='plot1.png')
dev.off()
