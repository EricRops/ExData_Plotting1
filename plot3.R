## Read relevant data, name columns, and create "datetime" variable for the x-axis
dataDirectory <- "C:/Users/ericr/Downloads/Coursera Data/Exploratory Data Analysis/data"
data <- read.table(file.path(dataDirectory, "household_power_consumption.txt"), sep = ";",
                           skip = 66637, nrows = 2880)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
    "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(data$Date, data$Time)
data$Date_Time <- as.POSIXct(datetime)

## Create plot and save as PNG
png("plot3.png", width=480, height=480)
with(data, {
    plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Date_Time, Sub_metering_2, col = "Red")
    lines(Date_Time, Sub_metering_3, col = "Blue")
})
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() ## Don't forget to close the PNG device

