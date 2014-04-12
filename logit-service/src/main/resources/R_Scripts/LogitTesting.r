library(nnet)

args <- commandArgs(TRUE)
dataset <- read.csv(args[1])
modelFile <- args[2]
outputType <- args[3]
load(modelFile)
pred_label <- predict(LogitModel, newdata = dataset, type = "class")
if(outputType == 'predictions') {
    print(pred_label)
} else if(outputType == 'confusion_matrix') {
    # Assuming that the last column contains the actual labels
    cols <- names(dataset)
    n_cols <- length(cols)
    confusionMatrix <- table(pred = pred_label, true = dataset[, n_cols])
    print(confusionMatrix)
} else {
    print("Wrong value for output-type!")
}