hpc <- read.table("E:/R/exdata-data-household_power_consumption/hpc.txt", sep=";", quote="\"",header=TRUE)
hpc[,"Date"]<-as.Date(hpc[,"Date"],format='%d/%m/%Y')
data<-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")
data[,"Global_active_power"]<-as.numeric(data[,"Global_active_power"])
hist(data$Global_active_power/1000,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

