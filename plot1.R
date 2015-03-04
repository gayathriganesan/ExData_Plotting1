## Exploratory Data Analysis -Course Project 1 - Plot1
# the source text file is at data/CourseProj1/household_power_consumption.txt under the working directory
filename<-file("data/CourseProj1/household_power_consumption.txt")
library(sqldf)
# only loads the data from the text file for Feb 1, 2007 & Feb 2, 2007; 
# prelimnary look at data indicates these dates will be in the text file as 1/2/2007 & 2/2/2007
df <- sqldf("Select * from filename where Date in ('1/2/2007','2/2/2007')", file.format=list(header=TRUE, sep=";"))
close(filename) # close connection
# df is the required dataframe of the 2 days with 2880 obs and 9 variables
# create the plot1
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
# allows you to experiment with plots results, and then save the plot as a png file to the cloned repo under ToGit 
dev.copy(png,filename="ToGit/ExData_Plotting1/plot1.png",width=480,height=480); 
dev.off()

