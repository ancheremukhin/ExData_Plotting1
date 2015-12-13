df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
df[,1] <- as.Date(df[,1], "%d/%m/%Y")
df <- subset(df, df$Date == "2007-02-01" | df$Date == "2007-02-02")

df <- within(df, { timestamp=as.POSIXct(paste(Date, Time)) })

png(filename="plot2.png")
plot(df$timestamp, df$Global_active_power,
 	type="l",
 	xlab="",
 	ylab="Global Active Power (kilowatts)"
)
dev.off()