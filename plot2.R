source("common.R")

MakePlot <- function(dataset, plot.file.name) {
  Sys.setlocale(category = "LC_ALL", locale = "C")
  png(plot.file.name)
  with(dataset, plot(type="l", datetime, Global_active_power,
                     xlab="", ylab="Global Active Power (kilowatts)"))
  dev.off()
}

data.file.path <- GetData()
dataset <- LoadDataset(data.file.path)
MakePlot(dataset, "plot2.png")
