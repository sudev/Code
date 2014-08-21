complete <- function(directory, id = 1:332) {
  file.name <- list.files(path = directory, full.names = T)
  nobs <- numeric(0)
  for( i in id) { 
    data <- read.csv(file.name[i])
    num  <- complete.cases(data)  
    num <- length(num[num == TRUE])
    nobs <- c( nobs, num)
  }
  df <- cbind.data.frame(id,nobs)
  colnames(df) <- c("id", "nobs")
  return(df) 
}
