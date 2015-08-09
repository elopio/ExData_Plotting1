source("common.R")

MakePlots <- function(dataset, plot.file.name) {
  Sys.setlocale(category = "LC_ALL", locale = "C")
  png(plot.file.name)
  par(mfrow=c(2, 2))
  MakePlot1(dataset)
  MakePlot2(dataset)
  MakePlot3(dataset)
  MakePlot4(dataset)
  dev.off()
}

MakePlot1 <- function(dataset) {
  with(dataset, plot(type="l", datetime, Global_active_power,
                     xlab="", ylab="Global Active Power (kilowatts)"))
}

MakePlot2 <- function(dataset) {
  with(dataset, plot(type="l", datetime, Voltage))
}

MakePlot3 <- function(dataset) {
  with(dataset, plot(type="n", datetime, Sub_metering_1,
                     ylab="Energy sub metering", xlab=""))
  with(dataset, lines(type="l", datetime, Sub_metering_1))
  with(dataset, lines(type="l", datetime, Sub_metering_2, col="red"))
  with(dataset, lines(type="l", datetime, Sub_metering_3, col="blue"))
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1), col=c("black", "red", "blue"))

}

MakePlot4 <- function(dataset) {
  with(dataset, plot(type="l", datetime, Global_reactive_power))
}

data.file.path <- GetData()
dataset <- LoadDataset(data.file.path)
MakePlots(dataset, "plot4.png")
