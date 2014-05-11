##Read the entire table from folder
hpc <- read.table("E:/R/exdata-data-household_power_consumption/hpc.txt", sep=";", quote="\"",header=TRUE)
##Convert the Dates to Date Class
hpc[,"Date"]<-as.Date(hpc[,"Date"],format='%d/%m/%Y')
##Subset Dates falling on 2007-02-01 and 2007-02-02
data<-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")
##Change the class of the respective headers from factor to numeric
data[,"Global_active_power"]<-as.numeric(data[,"Global_active_power"])
data[,"Global_reactive_power"]<-as.numeric(data[,"Global_reactive_power"])
data[,"Voltage"]<-as.numeric(data[,"Voltage"])
data[,"Sub_metering_1"]<-as.numeric(data[,"Sub_metering_1"])
data[,"Sub_metering_2"]<-as.numeric(data[,"Sub_metering_2"])
data[,"Sub_metering_3"]<-as.numeric(data[,"Sub_metering_3"])
data$DateTime <- do.call(paste,c(data[c("Date","Time")],sep=" "))
data[,"DateTime"]<-as.POSIXct(data[,"DateTime"], format = "%Y-%m-%d %H:%M:%S")

##Set the margin of the plot
par(mar=c(4,4,1,1))
##Divide the canvas to fit 4 plots
par(mfrow=c(2,2))
##Plot the 4 plots
plot(data$DateTime,data$Global_active_power/1000,lwd=1,type="l",xlab="",ylab="Global Active Power")
plot(data$DateTime,data$Voltage,lwd=1,type="l",xlab="datetime",ylab="Voltage")
plot(data$DateTime,data$Sub_metering_1,ylim=c(0,35),lwd=1,type="l",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,lwd=1,type="l",xlab="",ylab="Energy sub metering",col="red")
lines(data$DateTime,data$Sub_metering_3,lwd=1,type="l",xlab="",ylab="Energy sub metering",col="blue")
legend("topright",pch="",lwd=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$DateTime,data$Global_reactive_power,lwd=1,type="l",xlab="datetime",ylab="Global_reactive_power")
