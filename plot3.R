
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
download.file( fileUrl,destfile="household_power_consumption.zip" )
system( "unzip household_power_consumption.zip" )

hpc <- read.csv( file="household_power_consumption.txt", sep=";",colClasses="character")
hpc <- subset( hpc, Date=="1/2/2007" | Date=="2/2/2007" )

library(reshape2)
plt3 <- melt(hpc,id=c("Date","Time"),measure.vars=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png( file="plot3.png",width = 480,height = 480 )
with(plt3, plot( strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), value, type="n",xlab="",ylab="Energy sub metering"))
with(subset(plt3,variable=="Sub_metering_1"),points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"),value,type="l"))
with(subset(plt3,variable=="Sub_metering_2"),points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"),value,type="l",col="red"))
with(subset(plt3,variable=="Sub_metering_3"),points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"),value,type="l",col="blue"))
legend("topright", lty=1,col = c( "black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

