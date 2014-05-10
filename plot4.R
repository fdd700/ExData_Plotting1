#takes too long, too much memory
#dt=read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
# thanks you Mary, Marcus at all https://class.coursera.org/exdata-002/forum/thread?thread_id=19
dt = read.table("household_power_consumption.txt",
                skip = 66637, nrow = 2880, sep = ";", 
                col.names = colnames(read.table("household_power_consumption.txt",
                                                nrow = 1, header = TRUE, sep=";")))
dts=subset(dt,as.Date(dt$Date,"%d/%m/%Y") %in% as.Date(c("2007-02-01","2007-02-02")))
dts$DateTime = as.POSIXct(paste(as.Date(dt$Date,"%d/%m/%Y"), dts$Time), format="%Y-%m-%d %H:%M:%S")
#for (i in 7:10) dts[,i]=as.numeric(dts[,i])
#I know the original has a transparent backgrpound, but looks too ugly on my screeen 
png("plot4.png", width = 504, height = 504, bg = "white")
par(mfrow=c(2,2))
plot(dts$DateTime,dts[,3],xlab="",ylab="Global Active Power",type="l")
plot(dts$DateTime,dts[,5],xlab="datetime",ylab="Voltage",type="l")
plot(dts$DateTime,dts[,7],xlab="",ylab="Energy sub metering",type="l")
lines(dts[,10],dts[,8],col="Red")
lines(dts[,10],dts[,9],col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = c(1,1,1), bty = "n")
plot(dts$DateTime,dts[,4],xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
