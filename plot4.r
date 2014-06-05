# read data
Data <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";")
Data$Date <- as.Date(Data$Date,format='%d/%m/%Y')
# subset the dataset
startDate <- as.Date('2007-02-01')
endDate <- as.Date('2007-02-02')
sub <- Data[which(Data$Date==startDate|Data$Date==endDate),]
# combine data and time
sub$Time<-strptime(paste(sub$Date,sub$Time),format='%Y-%m-%d %H:%M:%S')
sub$Sub_metering_1<-as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2<-as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3<-as.numeric(as.character(sub$Sub_metering_3))

# save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
png('plot4.png',width=480,height=480)
par(mfrow=c(2,2))
x<-sub$Time
y1 <-as.numeric(as.character(sub$Global_active_power))
plot(x,y1,type='l',ylab='Global Active Power(kilowatts)',xlab='')

y2<-as.numeric(as.character(sub$Voltage))
plot(x,y2,type='l',ylab='Voltage',xlab='datetime')

y3<-c(min(min(sub$Sub_metering_1),min(sub$Sub_metering_2),min(sub$Sub_metering_3))
     ,max(max(sub$Sub_metering_1),max(sub$Sub_metering_2),max(sub$Sub_metering_3)))
length(y3)<-length(x)
plot(x,y3,type='n',ylab='Energy sub metering',xlab=' ')
lines(x,sub$Sub_metering_1)
lines(x,sub$Sub_metering_2,col='red')
lines(x,sub$Sub_metering_3,col='blue')
legend("topright",legend=c('sub_metering_1','sub_metering_2','sub_metering_3')
       ,lty=1,bty='l',col=c('black','red','blue'))

y4 <-as.numeric(as.character(sub$Global_reactive_power))
plot(x,y4,type='l',ylab='Global_reactive_power',xlab='datetime ')
dev.off()
