## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data
Download the zipped dataset from the above source; Unzip the zipped folder and make sure that the text file is at <b><i>data/CourseProj1/household_power_consumption.txt</i></b> under your working directory.

When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and 2007-02-02 for all 4 plots. 
So I only read the data from just those dates into the R dataset, using the sqldf package and
just selecting for the Date columns having the values of '1/2/2007' and '2/2/2007' as strings.
This is sufficient for the first plot.

* For the 2nd, 3rd and 4th plots, the Date and Time variables have to be converted to Date/Time class.
I use the lubridate package to accomplish this.

## Project Requirements :
First fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the 4 plots shown in the figure folder, all of which were constructed
using the base plotting system.

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.

##Plotting Process :
<ol>
<li>Use the sqldf function to get the selected dataset for the 1st and 2nd of Feb 2007. Create the 1st histogram plot from this dataset, using the hist function. </li>
<li>Concatenate the Date and Time variables using paste. Use the lubridate package to get a Date/Time class for the resulting variable. Plot the second plot, which is a scatter plot, setting the x and y labels and adjusting the size of the datapoints.</li>
<li>For the 3rd plot, initialize the scatter plot using type="n", so that the plot is not actually drawn. Use the lines function to add in the plots for the 3 Sub_metering variables in different colors. Add a legend in the top right section of the plot</li>
<li>For the 4th plot (containing 4 multiple scatter plots), use the mfrow par to have 2 columns and 2 rows. Adjust the margins so the labels are visible. Add the required plots sequentially.</li>
<li>Save all the 4 plots generated above as a png file using dev.copy and png functions</li>
</ol>

