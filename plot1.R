data <- read.table("C:/Users/willi/OneDrive/Desktop/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## change class of all columns to correct class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## plot histogram
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()