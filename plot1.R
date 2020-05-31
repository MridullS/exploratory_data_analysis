library(dplyr)

plot1 <- function() {
  file_read <- read.csv2('household_power_consumption.txt', dec='.', na.strings='?',
                  stringsAsFactors=FALSE)
  start <- ymd('2007-02-01')
  end <- ymd('2007-02-03')
  file_read <- file_read %>%
    mutate(DateTime=dmy_hms(paste(Date, Time))) %>%
    select(DateTime, Global_active_power:Sub_metering_3) %>%
    filter(DateTime >= start, DateTime < end)
  
  png(filename='plot1.png', width=480, height=480, units='px')
  with(file_read, hist(file_read$Global_active_power, col='red',
                xlab='Global Active Power (kilowatts)',
                main='Global Active Power'))
  dev.off()
}