corr <- function(directory, threshold = 0) {
  correlations <- vector()
  complete.df <- complete(directory)
  complete.df <- subset(complete.df, complete.df$nobs > threshold)
  if (nrow(complete.df) > 0) { 
    file.name <- list.files(path = directory, full.names = T)
    for(i in 1:nrow(complete.df)) {
      data <- read.csv(file.name[complete.df$id[i]])
      completeCases <- data[complete.cases(data),]
      if( nrow(completeCases) >= threshold ) {
        correlations <- c(correlations, cor(completeCases$nitrate, completeCases$sulfate) )
      }
    }
  } else { 
    correlations <- numeric(0)
  }
  correlations
}