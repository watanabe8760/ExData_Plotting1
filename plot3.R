library(sqldf)

# Read target data
data <- read.csv.sql("household_power_consumption.txt", 
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                     header = TRUE, sep = ";", 
                     colClasses = c(rep("character", 2), rep("numeric", 6)))

# Create Date-Time variable 
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %T")

# Open device
png(file = "plot3.png",
    width = 480, height = 480)

# Create Line Chart
plot(x = data$Datetime, 
     y = data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(x = data$Datetime,
      y = data$Sub_metering_2,
      type = "l",
      col = "red")

lines(x = data$Datetime,
      y = data$Sub_metering_3,
      type = "l",
      col = "blue")

# Add legend
legend("topright",
       names(data)[7:9],
       lty = 1,
       col = c("black", "red", "blue"))

# Close device
dev.off()
