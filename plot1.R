
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
download.file( fileUrl,destfile="household_power_consumption.zip" )
system( "unzip household_power_consumption.zip" )

hpc <- read.csv( file="household_power_consumption.txt", sep=";",colClasses="character")
hpc <- subset( hpc, Date=="1/2/2007" | Date=="2/2/2007" )

png( file="plot1.png",width = 480,height = 480 )
hist( as.numeric(hpc$Global_active_power),col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)" )
dev.off()

