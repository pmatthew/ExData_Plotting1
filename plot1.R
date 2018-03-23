
input <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
input[input == "?"] <- NA
input$DateTime <- as.POSIXct(paste(input$Date,input$Time), format = "%d/%m/%Y %H:%M:%S")
input$Global_active_power <- as.numeric(as.character(input$Global_active_power))



h <- hist(input$Global_active_power[input$Global_active_power < 6], breaks = 12, plot = FALSE)
h$counts <- h$counts / 1000

png(file = "plot1.png", bg = "white", width = 480, height = 480)
plot(h, ylim = c(0,1200), xlim = c(0,6), col = "red", xaxt = 'n', xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
axis(1, at=seq(0,6,2))
dev.off()


