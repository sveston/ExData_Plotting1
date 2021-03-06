##Read the entire table from folder
hpc <- read.table("E:/R/exdata-data-household_power_consumption/hpc.txt", sep=";", quote="\"",header=TRUE)
##Convert the Dates to Date Class
hpc[,"Date"]<-as.Date(hpc[,"Date"],format='%d/%m/%Y')
##Subset Dates falling on 2007-02-01 and 2007-02-02
data<-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")
##Change the class of Sub Meterings from factor to numeric
data[,"Sub_metering_1"]<-as.numeric(data[,"Sub_metering_1"])
data[,"Sub_metering_2"]<-as.numeric(data[,"Sub_metering_2"])
data[,"Sub_metering_3"]<-as.numeric(data[,"Sub_metering_3"])
##Concatenate the Date and Time and form another column call DateTime
data$DateTime <- do.call(paste,c(data[c("Date","Time")],sep=" "))
##Convert the DateTime column to Date/Time class
data[,"DateTime"]<-as.POSIXct(data[,"DateTime"], format = "%Y-%m-%d %H:%M:%S")

##Set the margin of the plot
par(mar=c(4,4,1,1))
##Plot the first Sub meter
plot(data$DateTime,data$Sub_metering_1,ylim=c(0,35),lwd=1,type="l",xlab="",ylab="Energy sub metering")
##Overlay the second Sub meter
lines(data$DateTime,data$Sub_metering_2,lwd=1,type="l",xlab="",ylab="Energy sub metering",col="red")
##Overlay the third Sub meter
lines(data$DateTime,data$Sub_metering_3,lwd=1,type="l",xlab="",ylab="Energy sub metering",col="blue")
##Add the Legend
legend("topright",pch="",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

