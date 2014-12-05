data<-read.csv("household_power_consumption.txt", sep=";",na.strings=c("NA", "-", "?"))

data1<-data[which((as.Date(data[,1],"%d/%m/%Y"))=="2007-02-01"),]
data2<-data[which((as.Date(data[,1],"%d/%m/%Y"))=="2007-02-02"),]
datadays<-rbind(data1,data2)
global_active_power<-datadays[,3] 

png(filename = "plot1.png", width = 480, height = 480)

hist(global_active_power, col="red", breaks=11, main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency")

dev.off()
