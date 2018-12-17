
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
download.file( fileUrl,destfile="household_power_consumption.zip" )
system( "unzip -o household_power_consumption.zip" )

hpc <- read.csv( file="household_power_consumption.txt", sep=";",colClasses="character")
hpc <- subset( hpc, Date=="1/2/2007" | Date=="2/2/2007" )

png( file="plot2.png",width = 480,height = 480 )
with(hpc, plot( strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

