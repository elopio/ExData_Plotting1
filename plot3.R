source("common.R")

MakePlot <- function(dataset, plot.file.name) {
  Sys.setlocale(category = "LC_ALL", locale = "C")
  png(plot.file.name)
  with(dataset, plot(type="n", datetime, Sub_metering_1,
                     ylab="Energy sub metering", xlab=""))
  with(dataset, lines(type="l", datetime, Sub_metering_1))
  with(dataset, lines(type="l", datetime, Sub_metering_2, col="red"))
  with(dataset, lines(type="l", datetime, Sub_metering_3, col="blue"))
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1), col=c("black", "red", "blue"))
  dev.off()
}

data.file.path <- GetData()
dataset <- LoadDataset(data.file.path)
MakePlot(dataset, "plot3.png")
