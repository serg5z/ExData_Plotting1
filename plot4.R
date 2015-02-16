source("common.R")
make_plot4 <- function(data=NULL) {
   if(is.null(data)) {
      data <- load();
   }
   
   png(filename="plot4.png", width=480, height=480, bg=NA);
   
   par(mfrow = c(2, 2))
   with(data, {
      plot(DateTime, Global_active_power, type="l", 
           xlab="", 
           ylab="Global Active Power (kilowatts)");
      plot(DateTime, Voltage, type="l", 
           xlab="datetime", 
           ylab="Voltage");
      {
         plot(DateTime, Sub_metering_1, col="black", type="l", 
              xlab="", 
              ylab="Energy sub metering");
         lines(DateTime, Sub_metering_2, col="red",
               xlab="", 
               ylab="Global Active Power (kilowatts)");
         lines(DateTime, Sub_metering_3, col="blue",
               xlab="", 
               ylab="Global Active Power (kilowatts)");
         legend("topright",  
                bg="transparent", box.lty=0,
                col = c("black", "red", "blue"), 
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                lty=1);
      }
      plot(DateTime, Global_reactive_power, type="l", 
           xlab="datetime");
      
   });
   
   dev.off();
}