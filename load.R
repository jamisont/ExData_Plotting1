## These are paired functions to:
## Create an object that sets and gets the filename and dataframe
## Retrieve the cached dataframe OR generate a new dataframe

## This creates a list from a filename to:
## set the filename; get the filename; set the dataframe; get the dataframe
makeCacheDat <- function(filename = character()) {
    dat <- NULL
    set <- function(y) {
        filename <<- y
        dat <<- NULL
    }
    get <- function() filename
    setDat <- function(dataframe) dat <<- dataframe
    getDat <- function() dat
    list(set = set, get = get,
         setDat = setDat, getDat = getDat)
}

## This checks whether the dataframe has been generated. If so, it uses
## the cached dataframe. Otherwise, it creates the dataframe and stores it.

cacheData <- function(cache, ...) {
    dat <- cache$getDat()
    if(!is.null(dat)) {
        message("getting cached data")
        return(dat)
    }
    file <- cache$get()
    library(sqldf)
    dat <- read.csv.sql(file, 
                        sql = "select * from file 
                           where Date = '1/2/2007' OR Date = '2/2/2007'",
                        header = T,
                        sep = ";")
    ## Add a new DateTime column by pasting the Date and Time columns
    cols <- c("Date", "Time")
    dat$DateTime <- apply( dat[ , cols], 1, paste, collapse = " ")
    ## Coerce the DateTime column to Date/Time class using strptime
    dat$DateTime <- strptime(dat$DateTime, "%d/%m/%Y %H:%M:%S")
    ## Formatting matches the particular file characteristics
    cache$setDat(dat)
    dat
    
}