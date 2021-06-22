# Load the caret package
library(caret)

# Import dataset
dataset <- read.csv('../datasets/iris-dataset.csv')

set.seed(100)

# Split data
trainRowNumbers <- createDataPartition(dataset$Species, p=0.8, list=FALSE)
trainData <- dataset[trainRowNumbers,]
testData <- dataset[-trainRowNumbers,]

# Train a MLP with 1 layers with 3 neurons
model <- train(form=Species ~ .,       # outcome ~ predictors
               data=trainData,
               method='nnet',
               trControl=trainControl(method="repeatedcv", number=10, repeats=10),
               tuneGrid=expand.grid(size=3, decay=0),
               trace=FALSE)     # avoids verbose output 

# Predict "Species" attribute for data in testData using the model trained before
prediction <- predict(model, testData[-5])
print(prediction)  # 30 predictions are made, because nrow(testData) = 30

# Create a confusion matrix with all possible evaluation metrics
cm <- confusionMatrix(reference = as.factor(testData$Species), data = prediction, mode='everything')
print(cm)