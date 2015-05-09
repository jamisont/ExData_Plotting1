plot3 <- function() {
    source("load.R") # load.R contains code for loading data
    ## Store dataframe in R object "energy"
    cache <- makeCacheDat("household_power_consumption.txt")
    energy <<- cacheData(cache)
    
    png("plot3.png")
    # Create initial plot with sub_metering_1 in default black
    plot(energy$DateTime, energy$Sub_metering_1, 
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
    dev.off()
}