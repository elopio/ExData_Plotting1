source("common.R")

MakePlot <- function(dataset, plot.file.name) {
  png(plot.file.name)
  hist(dataset$Global_active_power, main="Global Active Power",
       xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}

data.file.path <- GetData()
dataset <- LoadDataset(data.file.path)
MakePlot(dataset, "plot1.png")
