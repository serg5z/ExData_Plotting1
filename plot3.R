source("common.R")
make_plot3 <- function(data=NULL) {
   if(is.null(data)) {
      data <- load();
   }
   
   png(filename="plot3.png", width=480, height=480, bg=NA)
   with(data, plot(DateTime, Sub_metering_1, col="black", type="l", 
                   xlab="", 
                   ylab="Energy sub metering"));
   with(data, lines(DateTime, Sub_metering_2, col="red",
                   xlab="", 
                   ylab="Global Active Power (kilowatts)"));
   with(data, lines(DateTime, Sub_metering_3, col="blue",
                   xlab="", 
                   ylab="Global Active Power (kilowatts)"));
   legend("topright",  
          bg="transparent",           
          col = c("black", "red", "blue"), 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
          lty=1)
   dev.off();
} 