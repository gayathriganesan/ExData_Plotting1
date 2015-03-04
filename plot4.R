## Exploratory Data Analysis -Course Project 1 - Plot4
# the source text file is at data/CourseProj1/household_power_consumption.txt under the working directory
filename<-file("data/CourseProj1/household_power_consumption.txt")
library(sqldf)
# only loads the data from the text file for Feb 1, 2007 & Feb 2, 2007; 
# prelimnary look at data indicates these dates will be in the text file as 1/2/2007 & 2/2/2007
df <- sqldf("Select * from filename where Date in ('1/2/2007','2/2/2007')", file.format=list(header=TRUE, sep=";"))
close(filename) # close connection
# df is the required dataframe of the 2 days with 2880 obs and 9 variables
library(lubridate)
#join the date & Time variables and conver to a date using lubridate package
df<- transform(df,completedate=dmy_hms(paste(df$Date,df$Time)))
par(mfrow=c(2,2))
par(mar=c(5,4,2,2))
plot(df$completedate,df$Global_active_power,ylab="Global Active Power",xlab="",pch=1,cex=0.05)
lines(df$completedate,df$Global_active_power,type="l")
plot(df$completedate,df$Voltage,ylab="Voltage",xlab="datetime",pch=1,cex=0.05)
lines(df$completedate,df$Voltage,type="l")
plot(df$completedate,df$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
lines(df$completedate,df$Sub_metering_1,col="black",lwd=1)
lines(df$completedate,df$Sub_metering_2,col="orangered",lwd=1)
lines(df$completedate,df$Sub_metering_3,col="blue",lwd=1)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","orangered","blue"),cex=.75,bty="n")
plot(df$completedate,df$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",pch=1,cex=0.05)
lines(df$completedate,df$Global_reactive_power,type="l")

dev.copy(png,filename="ToGit/ExData_Plotting1/plot4.png",width=480,height=480)
dev.off();