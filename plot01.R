setwd('~/git/Coursera/DataScience/ExData_Plotting1')

# Read the data
data <- read.csv(file='data/household_power_consumption.txt',sep=';',
                 na.strings=c('?'),
                 colClasses=c("character","character","numeric","numeric",
                              "numeric","numeric","numeric","numeric",
                              "numeric"))

# Convert the date column
data[[1]] <- as.Date(data[[1]],"%d/%m/%Y")

# Select only data from the 2 days in February
data.2days <- subset(data, data$Date >= as.Date("2007-02-01") 
                     & data$Date <= as.Date("2007-02-02"),
                     select=Global_active_power)

# Output to file
png('plot01.png')
hist(data.2days$Global_active_power, col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
