
#Downloading and loading data

#First, I remove everything in my global environment and set my working directory
rm(list=ls())
setwd("~/Google Drive/CARPETA FACU-CASA/Econometría y métodos/Data Science/Cursos R coursera/2020/Curso 3. Exploratory Data Analysis/Week 1/Week 1 assignment")

if(!file.exists("data")){dir.create("data")}
FileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(FileURL,destfile="./data/household_power_consumption.zip", method= "curl")
list.files("./data")

# Unzip databases to /data directory, defining the path in which the new folder is located:
unzip(zipfile="./data/household_power_consumption.zip",exdir="./data")
list.files("./data")

#Reading the data, na.strings is set to "?":
data <- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?" )


##I convert the Date and time into an only variable in Date/Time format:
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

##Extracting only the dates 2007-02-01 and 2007-02-02. 
reduced_data <- data[(data$DateTime >= "2007-02-01") & (data$DateTime < "2007-02-03"),]

#I remove the initial dataset to avoid overloading memory:
rm(data)

#I open the PNG graphic device:
png(filename="plot3.png", width = 480, height = 480)

#I produce the plot:
plot(reduced_data$DateTime, reduced_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(reduced_data$DateTime, reduced_data$Sub_metering_2, col="red")
lines(reduced_data$DateTime, reduced_data$Sub_metering_3, col="blue")
legend("topright", lty=1, col =c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#I close the device
dev.off()