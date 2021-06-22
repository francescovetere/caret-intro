# Load the caret package
library(caret)

# Import dataset
dataset <- read.csv('../datasets/cars-dataset.csv')

set.seed(100)

# Split data
trainRowNumbers <- createDataPartition(dataset$Car_price, p=0.8, list=FALSE)
trainData <- dataset[trainRowNumbers,]
testData <- dataset[-trainRowNumbers,]

# print(nrow(trainData)) # 771
# print(nrow(testData))  # 192

trainData <- dataset[trainRowNumbers,]
testData <- dataset[-trainRowNumbers,]

model = train(form=Car_price ~ .,
              data=dataset,
              method="mlp",
              preProc=c("center", "scale"), # Preprocessing can be done also here
              trControl=trainControl(method="repeatedcv", number=3, repeats=3),
              tuneGrid=expand.grid(size=3),
              metric="RMSE",      # Root mean squared error as metric
              trace=FALSE)

# Predict "Car_price" attribute for data in testData using the model trained before
prediction <- predict(model, testData[-6])
print(prediction) # 192 predictions are made, because nrow(testData) = 192

# Print, among other things, the final RMSE
print(model)