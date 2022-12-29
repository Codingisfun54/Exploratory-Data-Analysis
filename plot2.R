data <- read.table("C:/Users/willi/OneDrive/Desktop/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## create NewDate variable and add it as a column to the dataset
NewDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, NewDate)

## change class of all columns to correct class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## plot globalactivepower vs date&time
png("plot2.png", width=480, height=480)
with(subsetdata, plot(NewDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()