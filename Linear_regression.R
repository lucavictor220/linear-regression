rm(list=ls())

library("caret")
set.seed(3456)
setwd("/Users/vitiok/University/IS/assignment_2")

nrOfFolds <- 5

data <- read.csv(file="hormigon.csv", header=TRUE, sep=",")
folds <- createMultiFolds(data, nrOfFolds, 1)




