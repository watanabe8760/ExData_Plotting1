library(sqldf)

# Read target data
data <- read.csv.sql("household_power_consumption.txt", 
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                     header = TRUE, sep = ";", 
                     colClasses = c(rep("character", 2), rep("numeric", 6)))

# Create Date-Time variable 
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %T")

# Open device
png(file = "plot2.png",
    width = 480, height = 480)

# Create Line Chart
plot(x = data$Datetime, 
     y = data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Close device
dev.off()