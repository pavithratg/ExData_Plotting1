##Loading relevant data to R
options(stringsAsFactors=F)
dataset <- read.table("household_power_consumption.txt",sep=";",na.strings="?",skip=66636,nrow=2880,quote="",header=TRUE,colClasses = "character")
colnames(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
transform.data <- transform(dataset,Date=as.Date(strptime(Date,"%d/%m/%Y")),Time=strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"))

##Creating the PNG file
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 0.3, 0.3),mgp=c(2.5,1,0))

plot(transform.data$Time,as.numeric(transform.data$Global_active_power),type="l",ylab="Global Active Power",xlab="",cex.axis=.7,cex.lab = .7)
plot(transform.data$Time,as.numeric(transform.data$Voltage),type="l",ylab="Voltage",xlab="datetime",cex.axis=.7,cex.lab = .7)
plot(transform.data$Time,as.numeric(transform.data$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="",cex.axis=.7,cex.lab = .7)
lines(transform.data$Time,as.numeric(transform.data$Sub_metering_2),col="red")
lines(transform.data$Time,as.numeric(transform.data$Sub_metering_3),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.3,bty = "n")
plot(transform.data$Time,as.numeric(transform.data$Global_reactive_power),type="l",ylab="Global_reactive_power",xlab="datetime",cex.axis=.7,cex.lab = .7)

dev.off()