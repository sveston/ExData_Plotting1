##Read the entire table from folder
hpc <- read.table("E:/R/exdata-data-household_power_consumption/hpc.txt", sep=";", quote="\"",header=TRUE)
##Convert the Dates to Date Class
hpc[,"Date"]<-as.Date(hpc[,"Date"],format='%d/%m/%Y')
##Subset Dates falling on 2007-02-01 and 2007-02-02
data<-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")
##Change the class of Global active power from factor to numeric
data[,"Global_active_power"]<-as.numeric(data[,"Global_active_power"])

##Set the margin of the plot
par(mar=c(4,4,1,1))
##Histogram plot of Global Active Power in Kilowatts
hist(data$Global_active_power/1000,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

