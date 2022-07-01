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
plot(hpc1$DateTime, hpc1$Global_active_power, type="l", 
     xlab="",   
     ylab = "Global Active Power (kilowatts)")


#PNG file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()  
