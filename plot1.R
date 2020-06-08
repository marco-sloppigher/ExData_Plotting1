library(dplyr)
library(lubridate)

df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
df_1 <- filter(df, Date %in% c("1/2/2007", "2/2/2007"))
df_1$Date <- dmy(df_1$Date)

hist(df_1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()
