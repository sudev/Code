best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  statelist <- unique(data$State)
  if(! (state %in% statelist) ) stop("invalid state")
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if(! (outcome %in% outcomes) ) stop("invalid outcome")
  ## Return hospital name in that state with lowest 30-day death
  if(outcome == "heart attack") { 
    col.nam <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  } else if ( outcome == "pneumonia") {
    col.nam <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  } else {
    col.nam <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  }
  #subset state 
  data <- subset(data, data$State == state)
  data[[col.nam]] <- as.numeric(data[[col.nam]])
  data <- data[which( ! (is.na(data[[col.nam]]))), ]
  data <- data[order(data[[col.nam]], data$Hospital.Name), ]
  return(data$Hospital.Name[1])
}