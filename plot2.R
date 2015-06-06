
## Read in the data and get to the subset to be graphed

setwd("C:/Users/jlyons/Desktop/Other/coursera/Exploratory Data Analysis/Week 1/Project Week 1/")

file="household_power_consumption.txt"

data<-read.table(file, header=TRUE, sep=";", na.strings="?", 
	colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
	)

data$date_time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

graph.set<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]


##  Build plot 2 and write to plot2.png

png(filename="plot2.png", width=480, height=480)

with(graph.set, plot(date_time, Global_active_power, type="n",
	main="",xlab="",ylab="Global Active Power (kilowatts)"))
with(graph.set, lines(date_time,Global_active_power))


dev.off()