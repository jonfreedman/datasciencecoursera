rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  lookup <- data.frame(
    row.names = c("heart attack", "heart failure", "pneumonia"),
    index = c(11, 17, 23)
  )
  index <- lookup[outcome, "index"]
  if (is.na(index)) {
    stop("invalid outcome")
  }
  
  ## For each state, find the hospital of the given rank Return a data frame
  ## with the hospital names and the /(abbreviated) state name
  stateData <- data[, c(2, index, 7)]
  stateData[, 2] <- suppressWarnings(as.numeric(stateData[, 2]))
  partitionedData <- split(stateData, stateData[, 3])
  sorted = lapply(partitionedData, function(x) {
    x <- x[order(x[, 2], x[, 1], na.last = NA), 1]
    
    if (num == "best") {
      x[1]
    } else if (num == "worst") {
      tail(x, n=1)
    } else {
      x[num]
    }
  })
  data.frame(hospital = unlist(sorted), state = names(sorted))
}