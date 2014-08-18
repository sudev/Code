
pollutantmean <- function(directory = 'specdata', pollutant, id = 1:332) {
  total.mean <- numeric(length(id))
  data.total <- numeric(0)
  file.name <- list.files(path = directory, full.names = T)
  for( i in id) { 
    data <- read.csv(file.name[i])
    data.total <- c(data.total, data[[pollutant]])
  }
  total.mean = mean(data.total, na.rm = TRUE)
  return(total.mean)
}
