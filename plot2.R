data<-read.csv("household_power_consumption.txt", sep=";",na.strings=c("NA", "-", "?"))
data1<-data[which((as.Date(data[,1],"%d/%m/%Y"))=="2007-02-01"),]
data2<-data[which((as.Date(data[,1],"%d/%m/%Y"))=="2007-02-02"),]
datadays<-rbind(data1,data2)
paste<-paste(datadays[,1], datadays[,2])
time<-strptime(paste, "%d/%m/%Y %H:%M:%S")
dataplot2<-cbind(time,datadays)

locale <- Sys.getlocale(category = "LC_TIME")
Sys.setlocale("LC_TIME", "English")

png(filename = "plot2.png", width = 480, height = 480)

plot(dataplot2[,1], dataplot2[,4], type="n", xlab="",ylab="Global Active Power(kilowatts)")
lines(dataplot2[,1], dataplot2[,4])
dev.off()
