## Read and subset
raw <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")
raw <- raw[raw$Date=="1/2/2007" | raw$Date=="2/2/2007",]
## Prepare as date/time
raw$Date = as.Date(as.character(raw$Date), format="%d/%m/%Y")
raw$Time = as.POSIXct(strftime(paste(as.character(raw$Date), as.character(raw$Time), sep=" "), format="%Y-%m-%d %H:%M:%S"))
## Plot
png('plot2.png', width=480, height=480)
plot(Global_active_power ~ Time, raw, type="l", ylab="Global Active Power (kilkowatts)", xlab="")
dev.off()