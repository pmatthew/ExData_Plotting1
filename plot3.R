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
input$Sub_metering_1 <- as.numeric(as.character(input$Sub_metering_1))
input$Sub_metering_2 <- as.numeric(as.character(input$Sub_metering_2))
input$Sub_metering_3 <- as.numeric(as.character(input$Sub_metering_3))

# Open PNG and plot there
png(file = "ExData_Plotting1/plot3.png", bg = "white", width = 480, height = 480)
    plot(input$DateTime, input$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="")
    lines(input$DateTime, input$Sub_metering_2, type = "l", col = "red")
    lines(input$DateTime, input$Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty = 1, legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()
