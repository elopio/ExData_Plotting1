GetData <- function() {
  # Gets the Electric power consumption dataset from the UC Irvine Machine
  # Learning Repository.
  #
  # If the data file already exists, it does nothing.
  #
  # Returns:
  #   The path of the data file.
  data.file.name <- "household_power_consumption.txt"
  data.dir <- "data"
  data.file.path <- file.path(data.dir, data.file.name)
  if (!file.exists(data.file.path)) {
    if (!file.exists(data.dir)) {
      dir.create(data.dir)
    }
    DownloadAndExtractData(data.dir)
  }
  return(data.file.path)
}

DownloadAndExtractData <- function(data.dir) {
  # Downloads and extracts teh data file required for the project.
  #
  # If the compressed file already exists, it is not downloaded again.
  #
  # Args:
  #   data.dir: The name of the directory to store the downloaded data.
  file.name <- file.path(
    data.dir, "exdata_data_household_power_consumption.zip")

  if (!file.exists(file.name)) {
    # Replace special characters for URL encoded symbols.
    escaped.file.name <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
    file.url <- file.path("https://d396qusza40orc.cloudfront.net",
                          escaped.file.name)
    download.file(file.url, file.name, method="curl")
  }
  unzip(file.name, exdir=data.dir)
}

LoadDataset <- function(data.file.path) {
  # Reads and filters the data.
  #
  # Args:
  #   data.file.path: The path of the data file.
  #
  # Returns:
  #   The dataset table.
  raw.dataset <- read.csv(data.file.path, sep=";", na.strings=c("?"))
  dataset <- raw.dataset[
    raw.dataset$Date == "1/2/2007" | raw.dataset$Date == "2/2/2007",]
  return(dataset)
}

MakePlot <- function(dataset, plot.file.name) {
  png(plot.file.name)
  hist(dataset$Global_active_power, main="Global Active Power",
       xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}

data.file.path <- GetData()
dataset <- LoadDataset(data.file.path)
MakePlot(dataset, "plot1.png")
