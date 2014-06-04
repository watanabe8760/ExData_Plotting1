library(sqldf)

# Read target data
data <- read.csv.sql("household_power_consumption.txt", 
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                     header = TRUE, sep = ";", 
                     colClasses = c(rep("character", 2), rep("numeric", 6)))
# Open device
png(file = "plot1.png",
    width = 480, height = 480)

# Create histgram
hist(data$Global_active_power, 
     breaks = 12,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Close device
dev.off()