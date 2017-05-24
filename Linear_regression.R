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
trainingData_1_Indexes <- partitions$Fold1.Rep1;

# create a vector with all indexes of data
indexesOfInitialData <- c(1:length(data[, 1]))

# find indexes of test data for the first data frame taken from createMultiFolds()
testData_1_Indexes <- indexesOfInitialData[is.na(pmatch(indexesOfInitialData, trainingData_1_Indexes))]

# Extract train data from the indexes 
trainingData_1 <- data[trainingData_1_Indexes, ];

# Extract test data from the indexes
testData_1 <- data[testData_1_Indexes, ];

# Find variables needed for creating linear model
factors <- c(names(data));

# This variable holds the column name we want to create model upon on 
attributeToWorkWith <- "strength";

# Remove strength column... To avoid worning with lm() 
factors <- factors[factors != attributeToWorkWith];


# Generate formula from the given factors
linearModelFormula <- as.formula(paste("strength ~", paste(factors, collapse="+")));

# Create linear model from the formula and data given as data.frame
linearModel <- lm(linearModelFormula, trainingData_1);

linearModel

# Check for length of columns to prove everything is working properly
length(trainingData_1[, 1])
length(testData_1[, 1])


