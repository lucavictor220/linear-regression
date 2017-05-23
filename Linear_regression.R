rm(list=ls())

library("caret")
setwd("/Users/vitiok/University/IS/assignment_2")

nrOfFolds <- 5

data <- read.csv(file="hormigon.csv", header=TRUE, sep=",")

trainSet <- createMultiFolds(y=data, k=nrOfFolds, 1)
validateSet <- createFolds(y=data, k=nrOfFolds, list=TRUE, returnTrain = TRUE)

trainSet

validateSet

createFol

training.data = data[1, ]

