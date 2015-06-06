
## Read in the data and get to the subset to be graphed

setwd("C:/Users/jlyons/Desktop/Other/coursera/Exploratory Data Analysis/Week 1/Project Week 1/")

file="household_power_consumption.txt"

data<-read.table(file, header=TRUE, sep=";", na.strings="?", 
	colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
	)

data$date_time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

graph.set<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]


##  Build plot 3 and write to plot3.png

png(filename="plot3.png", width=480, height=480)

with(graph.set, plot(date_time, Sub_metering_1, type = "n",
	main="",xlab="",ylab="Energy sub metering"))
with(graph.set, lines(date_time, Sub_metering_1, col = "black"))
with(graph.set, lines(date_time, Sub_metering_2, col = "red"))
with(graph.set, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", lty=c(1,1,1), lwd=c(1,1,1), col=c("black","red","blue"),
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()
