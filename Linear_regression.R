rm(list=ls())

library("caret")
setwd("/Users/vitiok/University/IS/assignment_2")

nrOfFolds <- 5

# read data from csv file
data <- read.csv(file="hormigon.csv", header=TRUE, sep=",")

# create k-forlds cross-validation. createMultiFolds() returns folds with vector with indexes of traing data
partitions <- createMultiFolds(y=data[, 1], k=nrOfFolds, 1)


# Start ====== Uncomment to use another function which create training data ================= 


#trainingData <- createFolds(y=data[, 1], k=nrOfFolds, list=TRUE, returnTrain = TRUE)
#partitions <- createDataPartition(y=data[, 1], times=1, p=0.5, list=TRUE, groups = min(5, length(data[, 1])))

# ========================================== end


# create a vector with all the indexes of the training data by taking data from the fold1 of partitions variable
trainingData1 <- partitions$Fold1.Rep1;

# create a vector with all indexes of data
indexesOfInitialData <- c(1:length(data[, 1]))

# find indexes of test data for the first data frame taken from createMultiFolds()
testData1 <- indexesOfInitialData[is.na(pmatch(indexesOfInitialData, trainingData1))]

