rm(list=ls())

library("caret")
setwd("/Users/vitiok/University/IS/assignment_2")

nrOfFolds <- 5

# read data from csv file
data <- read.csv(file="hormigon.csv", header=TRUE, sep=",")

# create k-forlds cross-validation. createMultiFolds() returns folds with vector with indexes of traing data
partitions <- createMultiFolds(y=data[, 9], k=nrOfFolds, 1)


# Start ====== Uncomment to use another function which create training data ================= 


#trainingData <- createFolds(y=data[, 1], k=nrOfFolds, list=TRUE, returnTrain = TRUE)
#partitions <- createDataPartition(y=data[, 1], times=1, p=0.5, list=TRUE, groups = min(5, length(data[, 1])))

# ========================================== end


# create a vector with all the indexes of the training data by taking data from the fold1 of partitions variable
fold <- partitions$Fold1.Rep1;

# create a vector with all indexes of data
indexesOfInitialData <- c(1:length(data[, 1]))

# Find variables needed for creating linear model
factors <- c(names(data));

# This variable holds the column name we want to create model upon on 
attributeToWorkWith <- "strength";

# Remove strength column... To avoid worning with lm() 
factors <- factors[factors != attributeToWorkWith];

# Iterate through all the folds created by createMultiFolds() function and perform:
#   1. find indexes of test set
#   2. extract data from specified indexes for train and test sets
#   3. create model
#   4. predict strength
#   5. calculate mean
for (fold in partitions) {
  
  # find indexes of test data for the first data frame taken from createMultiFolds()
  testDataIndexes <- indexesOfInitialData[is.na(pmatch(indexesOfInitialData, fold))]
  
  # Extract train data from the indexes 
  trainData <- data[fold, ];
  
  # Extract test data from the indexes
  testData <- data[testDataIndexes, ];
  
  # Check for length of columns to prove everything is working properly
  #length(trainData[, 1])
  #length(testData[, 1])
  
  # Generate formula from the given factors
  linearModelFormula <- as.formula(paste("strength ~", paste(factors, collapse="+")));
  
  # Create linear model from the formula and data given as data.frame
  linearModel <- lm(linearModelFormula, trainData);
  
  # print linear model
  #linearModel
  
  # Predict data based on the build linear model
  predictedStrength <- predict(linearModel, testData);
  # print vector of predicted strengths
  #predictedStrength
  
  # calculate the mean value for build model
  meanValue <- mean(abs(predictedStrength - testData$strength));
  
  print(meanValue)
}




