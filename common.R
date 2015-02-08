load <- function() {
   dname <- "data";
   fname <- "household_power_consumption.txt";
   data_file = file.path(dname, fname);
   
   check <- file.exists(dname, data_file);
   if(!check[1]) {
      file.create(dname);
   }
   
   if(!check[2]) {
      tmp <- file.path(dname, "data.zip")
      download.file(url="https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",
                    destfile=tmp,
                    method="curl");
      unzip(tmp, exdir=dname);
   }
   
   data_frame <- read.csv(data_file, sep=";", na.strings="?", stringsAsFactors=FALSE);
   
   data_frame <- data_frame[data_frame$Date == "1/2/2007" | data_frame$Date == "2/2/2007",];
   data_frame <- cbind(DateTime=strptime(paste(data_frame[,"Date"], data_frame[,"Time"]), 
                                         format="%d/%m/%Y %H:%M:%S"), data_frame);
   data_frame
}
