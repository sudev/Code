checkrank <- function(data, rank.num) { 
  if( rank.num == "worst" ) {
    return(nrow(data))
  } else if (rank.num == "best" ) { 
    return(1)
  } else if (nrow(data) < rank.num ) {
    return(NA)
  } else {
    return(as.numeric(rank.num))
  }
}
rankall <- function( outcome, rank.num) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  statelist <- unique(data$State)
  statelist <- statelist[order(statelist)]
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
  data.all <- data
  hospital <- vector()
  for( i in statelist) { 
    data <- subset(data.all, data.all$State == i)
    data[[col.nam]] <- as.numeric(data[[col.nam]])
    data <- data[which( ! (is.na(data[[col.nam]]))), ]
    data <- data[order(data[[col.nam]], data$Hospital.Name), ]
    k <- checkrank(data, rank.num)
    if(is.na(k)) { 
      hosp <- NA
    } else { 
      hosp <- data$Hospital.Name[k]
    }
    hospital <- c(hospital, hosp)
  }
  df <- cbind.data.frame(hospital, statelist)
  colnames(df) <- c( "hospital", "state")
  return(df)
}

