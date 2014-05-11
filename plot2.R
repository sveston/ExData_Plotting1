##Read the entire table from folder
hpc <- read.table("E:/R/exdata-data-household_power_consumption/hpc.txt", sep=";", quote="\"",header=TRUE)
##Convert the Dates to Date Class
hpc[,"Date"]<-as.Date(hpc[,"Date"],format='%d/%m/%Y')
##Subset Dates falling on 2007-02-01 and 2007-02-02
data<-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")
##Change the class of Global active power from factor to numeric
data[,"Global_active_power"]<-as.numeric(data[,"Global_active_power"])
##Concatenate the Date and Time and form another column call DateTime
data$DateTime <- do.call(paste,c(data[c("Date","Time")],sep=" "))
##Convert the DateTime column to Date/Time class
data[,"DateTime"]<-as.POSIXct(data[,"DateTime"], format = "%Y-%m-%d %H:%M:%S")
##Set the margin of the plot
par(mar=c(4,4,1,1))
##Plot 
plot(data$DateTime,data$Global_active_power/1000,lwd=1,type="l",xlab="",ylab="Global Active Power (kilowatts)")
