# read data
Data <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";")
Data$Date <- as.Date(Data$Date,format='%d/%m/%Y')

# subset the dataset
startDate <- as.Date('2007-02-01')
endDate <- as.Date('2007-02-02')
sub <- Data[which(Data$Date==startDate|Data$Date==endDate),]

# combine data and time
sub$Time<-strptime(paste(sub$Date,sub$Time),format='%Y-%m-%d %H:%M:%S')

x<-sub$Time
sub$Sub_metering_1<-as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2<-as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3<-as.numeric(as.character(sub$Sub_metering_3))

y<-c(min(min(sub$Sub_metering_1),min(sub$Sub_metering_2),min(sub$Sub_metering_3))
     ,max(max(sub$Sub_metering_1),max(sub$Sub_metering_2),max(sub$Sub_metering_3)))
length(y)<-length(x)

# save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
png(filename="plot3.png",width=480,height=480)
plot(x,y,type='n',ylab='Energy sub metering',xlab=' ')
lines(x,sub$Sub_metering_1)
lines(x,sub$Sub_metering_2,col='red')
lines(x,sub$Sub_metering_3,col='blue')
legend("topright",legend=c('sub_metering_1','sub_metering_2','sub_metering_3')
       ,lty=1,bty='l',col=c('black','red','blue'))
dev.off()
