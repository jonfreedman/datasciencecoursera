rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if (! state %in% data[, 7]) {
    stop("invalid state")
  }
  lookup <- data.frame(
    row.names = c("heart attack", "heart failure", "pneumonia"),
    index = c(11, 17, 23)
  )
  index <- lookup[outcome, "index"]
  if (is.na(index)) {
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with the given rank 30-day death rate
  stateData <- data[data[,7] == state, c(2, index)]
  stateData[, 2] <- suppressWarnings(as.numeric(stateData[, 2]))
  sorted <- stateData[order(stateData[, 2], stateData[, 1], na.last = NA), 1]
  if (num == "best") {
    sorted[1]
  } else if (num == "worst") {
    tail(sorted, n=1)
  } else {
    sorted[num]
  }
}