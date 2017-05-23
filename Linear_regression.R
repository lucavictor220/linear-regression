rm(list=ls())

library("caret")
setwd("/Users/vitiok/University/IS/assignment_2")

nrOfFolds <- 5

data <- read.csv(file="hormigon.csv", header=TRUE, sep=",")

trainSet <- createMultiFolds(y=data[, 1], k=nrOfFolds, 1)
validateSet <- createFolds(y=data[, 1], k=nrOfFolds, list=TRUE, returnTrain = TRUE)


partitionedData <- createDataPartition(y=data[, 1], times=1, p=0.5, list=TRUE, groups=min(5, length(data)))

trainSet

validateSet

createFol



