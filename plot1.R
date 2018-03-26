#zipDirectory <- "C:/Users/ericr/Downloads/Coursera Data/Exploratory Data Analysis/data/exdata_data_household_power_consumption.zip"
#unzip(zipfile = zipDirectory,
#      exdir = "C:/Users/ericr/Downloads/Coursera Data/Exploratory Data Analysis/data")

## Read data, name columns, and change dates to Date class
dataDirectory <- "C:/Users/ericr/Downloads/Coursera Data/Exploratory Data Analysis/data"
data <- read.table(file.path(dataDirectory, "household_power_consumption.txt"), sep = ";",
    skip = 66637, nrows = 2880)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
    "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Create plot and save as PNG
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off() ## Don't forget to close the PNG device

