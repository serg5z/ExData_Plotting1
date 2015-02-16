source("common.R")
make_plot1 <- function(data=NULL) {
   if(is.null(data)) {
      data <- load();
   }
   
   png(filename="plot1.png", width=480, height=480, bg=NA)
   with(data, hist(Global_active_power, col="red", 
        main="Global Active Power", 
        xlab="Global Active Power (kilowatts)", 
        ylab="Frequency"));
   dev.off();
} 