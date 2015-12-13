df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
df[,1] <- as.Date(df[,1], "%d/%m/%Y")
df <- subset(df, df$Date == "2007-02-01" | df$Date == "2007-02-02")

png(filename="plot1.png")
hist(df$Global_active_power,
	col="red",
	xlab="Global Active Power (kilowatts)",
	main="Global Active Power"
)
dev.off()