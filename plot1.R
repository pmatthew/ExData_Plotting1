# Read csv
input <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
# Convert all '?' to NA
input[input == "?"] <- NA
# Make a new column a POSIX datetime
input$DateTime <- as.POSIXct(paste(input$Date,input$Time), format = "%d/%m/%Y %H:%M:%S")
# Fillter the dataframe based on the datetime for the selected two days
input <- subset(input, DateTime >= '2007-02-01 00:00:00' & DateTime < '2007-02-03 00:00:00')
# Convert the neccessary column to numeric
input$Global_active_power <- as.numeric(as.character(input$Global_active_power))

# Open PNG and plot there
png(file = "ExData_Plotting1/plot1.png", bg = "white", width = 480, height = 480)
    hist(input$Global_active_power, breaks = 12, ylim = c(0,1200), xlim = c(0,6), col = "red", xaxt = 'n', xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
    axis(1, at=seq(0,6,2))
dev.off()
