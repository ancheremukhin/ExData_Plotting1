df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
df[,1] <- as.Date(df[,1], "%d/%m/%Y")
df <- subset(df, df$Date == "2007-02-01" | df$Date == "2007-02-02")

df <- within(df, { timestamp=as.POSIXct(paste(Date, Time)) })

png(filename="plot4.png")
par(mfrow=c(2,2))

plot(df$timestamp, df$Global_active_power,
 	type="l",
 	xlab="",
 	ylab="Global Active Power"
)

plot(df$timestamp, df$Voltage,
 	type="l",
 	xlab="datetime",
 	ylab="Voltage"
)

plot(df$timestamp, df$Sub_metering_1,
	type="l",
	xlab="",
	ylab="Energy submetering"
)
lines(df$timestamp, df$Sub_metering_2, col="red")
lines(df$timestamp, df$Sub_metering_3, col="blue")
legend("topright", colnames(df)[c(7,8,9)], lty=1, col=c("black", "red", "blue"))

plot(df$timestamp, df$Global_reactive_power,
 	type="l",
 	xlab="datetime",
 	ylab="Global_reactive_power"
)

dev.off()