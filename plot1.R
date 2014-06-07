##Loading relevant data to R
options(stringsAsFactors=F)
dataset <- read.table("household_power_consumption.txt",sep=";",na.strings="?",skip=66636,nrow=2880,quote="",header=TRUE,colClasses = "character")
colnames(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
transform.data <- transform(dataset,Date=as.Date(strptime(Date,"%d/%m/%Y")),Time=strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"))

##Creating the PNG file
png("plot1.png", width = 480, height = 480)

##Creating the histogram
hist(as.numeric(transform.data$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",cex.axis=1,cex.lab = 1)

dev.off()