#Load data
hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                  na.strings="?")

#convert data
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, "%Y-%m-%d %H:%M:%S")


#select data
hpc1 <- hpc[(hpc$Date >= "2007-02-01" & hpc$Date <="2007-02-02"),]

Sys.setlocale("LC_ALL","English")  
#plot
png(filename="plot3.png", width=480, height=480)
with(hpc1, {
  plot(DateTime, Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
})

legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

#plot
#par(mfrow=c(1, 1))
#plot(hpc1$DateTime, hpc1$Sub_metering_1, type="l", 
#     xlab="",   
#     ylab = "Energy sub metering")
#lines(hpc1$DateTime, hpc1$Sub_metering_2, col="red")
#lines(hpc1$DateTime, hpc1$Sub_metering_3, col="blue")
#                              "Sub_metering_3"),col = c("black","red","blue"),
#       lty = 1)
       #, cex=0.5)


#PNG file
#dev.copy(png, file = "plot3.png", width=480, height=480)
#dev.off()  