library(sqldf)
subset_query <- "select * from file where Date in ('1/2/2007', '2/2/2007')"
data_file <- read.csv.sql(file="household_power_consumption.txt", sql = subset_query, header = TRUE, sep=";",colClasses="character")

data_file$Global_active_power = as.numeric(data_file$Global_active_power)
data_file$Sub_metering_1 = as.numeric(data_file$Sub_metering_1)
data_file$Sub_metering_2 = as.numeric(data_file$Sub_metering_2)
data_file$Sub_metering_3 = as.numeric(data_file$Sub_metering_3)
data_file$Voltage = as.numeric(data_file$Voltage)
data_file$Global_reactive_power = as.numeric(data_file$Global_reactive_power)
data_file$datetime <- strptime(paste(data_file$Date, data_file$Time), format = "%d/%m/%Y %H:%M:%S")


plot(data_file$date, data_file$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()

