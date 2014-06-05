# read data
Data <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";")
Data$Date <- as.Date(Data$Date,format='%d/%m/%Y')
# subset the dataset
startDate <- as.Date('2007-02-01')
endDate <- as.Date('2007-02-02')
sub <- Data[which(Data$Date==startDate|Data$Date==endData),]
# combine data and time
sub$Time<-strptime(paste(sub$Date,sub$Time),format='%Y-%m-%d %H:%M:%S')
sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))
# save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
png('plot1.png',width=480,height=480)
hist(sub$Global_active_power,xlab='Global Active Power(kilowatts)',col='red'
     ,ylab='Frequency',main='Global Active Power')
dev.off()
