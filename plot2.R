plot2 <- function() {
    source("load.R") # load.R contains code for loading data
    ## Store dataframe in R object "energy"
    cache <- makeCacheDat("household_power_consumption.txt")
    energy <<- cacheData(cache)
    
    png("plot2.png")
    plot(energy$DateTime,
         energy$Global_active_power,
         ylab = "Global Active Power (kilowatts)", 
         type = "l")
    dev.off()
}