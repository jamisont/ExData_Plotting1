plot1 <- function() {
    source("load.R") # load.R contains code for loading data
    ## Store dataframe in R object "energy"
    cache <- makeCacheDat("household_power_consumption.txt")
    energy <<- cacheData(cache)
    
    png("plot1.png")
    hist(energy$Global_active_power, 
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)", 
         ylab = "Frequency", 
         col = "red")
    dev.off()
}