#takes too long, too much memory
#dt=read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
# thanks you Mary, Marcus at all https://class.coursera.org/exdata-002/forum/thread?thread_id=19
dt = read.table("household_power_consumption.txt",
                skip = 66637, nrow = 2880, sep = ";", 
                col.names = colnames(read.table("household_power_consumption.txt",
                                                nrow = 1, header = TRUE, sep=";")))
dts=subset(dt,as.Date(dt$Date,"%d/%m/%Y") %in% as.Date(c("2007-02-01","2007-02-02")))
dts$DateTime = as.POSIXct(paste(as.Date(dt$Date,"%d/%m/%Y"), dts$Time), format="%Y-%m-%d %H:%M:%S")
#I know the original has a transparent backgrpound, but looks too ugly on my screeen 
png("plot2.png", width = 504, height = 504, bg = "white")
plot(dts$DateTime,dts[,3],xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()