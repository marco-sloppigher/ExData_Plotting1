library(dplyr)
library(lubridate)

df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
df_1 <- filter(df, Date %in% c("1/2/2007", "2/2/2007"))

df_2 <- mutate(df_1, Datetime = paste(Date, Time, sep = ' '))
df_2$Datetime <- dmy_hms(df_2$Datetime)
with(df_2, plot(Datetime, Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")
dev.off()
