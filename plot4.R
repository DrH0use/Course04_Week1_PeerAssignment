# Read and subset
raw <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")
raw <- raw[raw$Date=="1/2/2007" | raw$Date=="2/2/2007",]
## Prepare as date/time
raw$Date = as.Date(as.character(raw$Date), format="%d/%m/%Y")
raw$Time = as.POSIXct(strftime(paste(as.character(raw$Date), as.character(raw$Time), sep=" "), format="%Y-%m-%d %H:%M:%S"))
## Plot
png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))
## G1
plot(Global_active_power ~ Time, raw, type="l", ylab="Global Active Power", xlab="")
## G2
plot(Voltage ~ Time, raw, type="l", ylab="Voltage", xlab="datetime")
## G3
plot(Sub_metering_1 ~ Time, raw, type="l", ylab="Energy sub metering", xlab="")
lines(Sub_metering_2 ~ Time, raw, type="l", col="red")
lines(Sub_metering_3 ~ Time, raw, type="l", col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty=1)
## G4
plot(Global_reactive_power ~ Time, raw, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()