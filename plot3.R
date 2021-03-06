library(dplyr)
library(lubridate)

df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
df_1 <- filter(df, Date %in% c("1/2/2007", "2/2/2007"))

df_2 <- mutate(df_1, Datetime = paste(Date, Time, sep = ' '))
df_2$Datetime <- dmy_hms(df_2$Datetime)

with(df_2, plot(Datetime, Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering"))
lines(df_2$Datetime, df_2$Sub_metering_2, type = 'l', col = "red")
lines(df_2$Datetime, df_2$Sub_metering_3, type = 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.copy(png, file = "plot3.png")
dev.off()

