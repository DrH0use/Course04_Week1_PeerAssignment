## Read and subset
raw <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")
raw <- subset(raw, Date=="1/2/2007" | Date=="2/2/2007")
## Creating the file
png('plot1.png', width=480, height=480)
hist(raw$Global_active_power, main="Global Active Power", breaks = 12, col="red", ylab = "Frequency", xlab="Global Active Power (kilowats)", las=1)
dev.off()