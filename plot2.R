input <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
input[input == "?"] <- NA
input$DateTime <- as.POSIXct(paste(input$Date,input$Time), format = "%d/%m/%Y %H:%M:%S")
input <- subset(input, DateTime >= '2007-02-01 00:00:00' & DateTime < '2007-02-03 00:00:00')
input$Global_active_power <- as.numeric(as.character(input$Global_active_power))

h <- hist(input$Global_active_power, breaks = 12, plot = FALSE)

png(file = "ExData_Plotting1/plot2.png", bg = "white", width = 480, height = 480)
plot(input$DateTime, input$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()


