source("common.R")
make_plot2 <- function(data=NULL) {
   if(is.null(data)) {
      data <- load();
   }
   
   png(filename="plot2.png", width=480, height=480, bg=NA)
   with(data, plot(DateTime, Global_active_power, type="l", 
                   xlab="", 
                   ylab="Global Active Power (kilowatts)"));
   dev.off();
} 