data<-read.csv("household_power_consumption.txt", sep=";",na.strings=c("NA", "-", "?"))


data1<-data[which((as.Date(data[,1],"%d/%m/%Y"))=="2007-02-01"),]
data2<-data[which((as.Date(data[,1],"%d/%m/%Y"))=="2007-02-02"),]
datadays<-rbind(data1,data2)
paste<-paste(datadays[,1], datadays[,2])
time<-strptime(paste, "%d/%m/%Y %H:%M:%S")
dataplot2<-cbind(time,datadays)

locale <- Sys.getlocale(category = "LC_TIME")

## set English locale in order to have labels printed in English
Sys.setlocale("LC_TIME", "English")

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
#First plot
plot(dataplot2[,1], dataplot2[,4], type="n", xlab="",ylab="Global Active Power(kilowatts)")
lines(dataplot2[,1], dataplot2[,4])
#Second plot
plot(dataplot2[,1], dataplot2[,8],type="n", xlab="",ylab="Energy sub metering")
lines(dataplot2[,1], dataplot2[,8])
lines(dataplot2[,1], dataplot2[,9], col="red")
lines(dataplot2[,1], dataplot2[,10], col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Third plot
plot(dataplot2[,1], dataplot2[,6],type="n", xlab="datetime",ylab="Voltage")
lines(dataplot2[,1], dataplot2[,6])
#Fourth plot
plot(dataplot2[,1], dataplot2[,5],type="n", xlab="datetime",ylab="Global_reactive_power")
lines(dataplot2[,1], dataplot2[,5])
dev.off()