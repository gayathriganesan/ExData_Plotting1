## Exploratory Data Analysis -Course Project 1 - Plot2
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
# create plot 2 - scatter plot ; pch denotes small circle, cex gives size of circle
plot(df$completedate,df$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",pch=1,cex=0.1)
# joins points with lines 
lines(df$completedate,df$Global_active_power,type="l")
# copy to file
dev.copy(png,filename="ToGit/ExData_Plotting1/plot2.png",width=480,height=480);
dev.off()