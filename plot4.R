plot4 <- function() {
    source("load.R") # load.R contains code for loading data
    ## Store dataframe in R object "energy"
    cache <- makeCacheDat("household_power_consumption.txt")
    energy <<- cacheData(cache)
    
    png("plot4.png")
    # Set up 2x2 matrix for graphs
    par(mfrow = c(2, 2))
    # Plot graph (1, 1)
    plot(energy$DateTime, energy$Global_active_power, 
         xlab = "", ylab = "Global Active Power", type = "l")
    # Plot graph (1, 2)
    plot(energy$DateTime, energy$Voltage, xlab = "datetime", 
         ylab = "Voltage", type = "l")
    # Create initial plot for graph (2, 1)
    plot(energy$DateTime, energy$Sub_metering_1, xlab = "", 
         ylab = "Energy sub metering", type = "l")
    # Add sub_metering_2 in red
    points(energy$DateTime, energy$Sub_metering_2, type = "l", col = "red")
    # Add sub_metering_3 in blue
    points(energy$DateTime, energy$Sub_metering_3, type = "l", col = "blue")
    # Add legend
    legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                         "Sub_metering_3"), 
           lty = c(1, 1, 1), lwd=c(2.5, 2.5, 2.5), 
           col=c("black", "red", "blue"))
    # Plot graph (2, 2)
    plot(energy$DateTime, energy$Global_reactive_power, xlab = "datetime",
         ylab = "Global_reactive_power", type = "l")
    dev.off()
}