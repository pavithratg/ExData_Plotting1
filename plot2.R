##Loading relevant data to R
options(stringsAsFactors=F)
dataset <- read.table("household_power_consumption.txt",sep=";",na.strings="?",skip=66636,nrow=2880,quote="",header=TRUE,colClasses = "character")
colnames(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
transform.data <- transform(dataset,Date=as.Date(strptime(Date,"%d/%m/%Y")),Time=strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"))

##Creating the PNG file
png("plot2.png", width = 480, height = 480)

##Generating the plot
plot(transform.data$Time,as.numeric(transform.data$Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xlab=NA,cex.axis=.9,cex.lab = .9)

dev.off()