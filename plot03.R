setwd('~/git/Coursera/DataScience/ExData_Plotting1')

# Read the data
data <- read.csv(file='data/household_power_consumption.txt',sep=';',
                 na.strings=c('?'),
                 colClasses=c("character","character","numeric","numeric",
                              "numeric","numeric","numeric","numeric",
                              "numeric"))

# Create a datetime column from the date and the time column
data$DateTime <- strptime(paste(data[[1]], data[[2]]), "%d/%m/%Y %H:%M:%S")

# Select only data from the 2 days in February
data.2days <- subset(data, DateTime >= 
                       strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") 
                     & DateTime < 
                       strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S"),
                     select=c(Sub_metering_1,Sub_metering_2,Sub_metering_3, DateTime))

       
# Output to file
png('plot03.png')

with(data.2days, plot(DateTime,Sub_metering_1,
                      ylab="Energy sub metering",xlab="", type="l"))
with(data.2days,lines(DateTime,Sub_metering_2,col="red"))
with(data.2days,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black", "blue","red"))

dev.off()

