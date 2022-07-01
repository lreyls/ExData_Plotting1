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
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2, 2))

plot(hpc1$DateTime, hpc1$Global_active_power, type="l", 
     xlab="",   
     ylab = "Global Active Power (kilowatts)")

plot(hpc1$DateTime, hpc1$Voltage, type="l", 
     xlab="datetime",   
     ylab = "Voltage")

plot(hpc1$DateTime, hpc1$Sub_metering_1, type="l", 
     xlab="",   
     ylab = "Energy sub metering")
lines(hpc1$DateTime, hpc1$Sub_metering_2, col="red")
lines(hpc1$DateTime, hpc1$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"),col = c("black","red","blue"),
       lty = 1, bty="n")

plot(hpc1$DateTime, hpc1$Global_reactive_power, type="l", 
     xlab="datetime",   
     ylab = "Global_reactive_power")


dev.off() 