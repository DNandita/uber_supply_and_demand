> uber_request_data <- read.csv("Uber Request Data.csv", stringsAsFactors = F, na.strings = T)
> View(uber_request_data)
> str(uber_request_data)
'data.frame':	6745 obs. of  6 variables:
 $ Request.id       : int  619 867 1807 2532 3112 3879 4270 5510 6248 267 ...
 $ Pickup.point     : chr  "Airport" "Airport" "City" "Airport" ...
 $ Driver.id        : chr  "1" "1" "1" "1" ...
 $ Status           : chr  "Trip Completed" "Trip Completed" "Trip Completed" "Trip Completed" ...
 $ Request.timestamp: chr  "11/7/2016 11:51" "11/7/2016 17:57" "12/7/2016 9:17" "12/7/2016 21:08" ...
 $ Drop.timestamp   : chr  "11/7/2016 13:00" "11/7/2016 18:47" "12/7/2016 9:58" "12/7/2016 22:03" ...
 > uber_request_data$request_day = format (uber_request_data$Request.timestamp, "%d")
Error in format.default(uber_request_data$Request.timestamp, "%d") : 
  invalid 'trim' argument
> library(chron)
> uber_request_data$request_day = format (uber_request_data$Request.timestamp, "%d")
Error in format.default(uber_request_data$Request.timestamp, "%d") : 
  invalid 'trim' argument
> uber_request_data$request_time <- sub (":.*","",uber_request_data$Request.timestamp )
> uber_request_data$request_day = format(uber_request_data$Request.timestamp, "%d")
Error in format.default(uber_request_data$Request.timestamp, "%d") : 
  invalid 'trim' argument
> uber_request_data$request_time <- sub (" *","",uber_request_data$Request.timestamp )
> uber_request_data$request_time <- sub (" .*","",uber_request_data$Request.timestamp )
> uber_request_data$request_time <- uber_request_data$request_date
> uber_request_data$request_date <- sub (" .*","",uber_request_data$Request.timestamp )
> uber_request_data$request_time <- (uber_request_data$Request.timestamp - uber_request_data$request_date)
Error in uber_request_data$Request.timestamp - uber_request_data$request_date : 
  non-numeric argument to binary operator
> uber_request_data$request_time <- substr(uber_request_data$Request.timestamp, 10, 13)
> gsub("-0", "", uber_request_data$Request.timestamp)
> uber_request_data$Request.timestamp<-gsub("-0", "", uber_request_data$Request.timestamp)
> uber_request_data$Request.timestamp<-gsub("-0", "/", uber_request_data$Request.timestamp)
> 