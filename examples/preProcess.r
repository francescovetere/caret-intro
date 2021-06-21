# Load the caret package
library(caret)

# Import dataset
dataset <- read.csv('../datasets/iris-dataset.csv')

print("before\n")
print(head(dataset))

# We want to normalize our dataset
preProcess_range_model <- preProcess(dataset, method='range')
dataset <- predict(preProcess_range_model, newdata = dataset)

print("after\n")
print(head(dataset))