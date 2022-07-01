#Load data
hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                  na.strings="?")

#convert data
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

#select data
hpc1 <- hpc[(hpc$Date >= "2007-02-01" & hpc$Date <="2007-02-02"),]

#plot

hist(hpc1$Global_active_power,col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#PNG file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()  

