run_analysis <- function(){

    # Including the dplyr library
    library(dplyr)
    
    # Reading the necessary files
    xTrain <- read.table("X_train.txt")
    xTest <- read.table("X_test.txt")
    yTrain <- read.table("y_train.txt")
    yTest <- read.table("y_test.txt")
    sTest <- read.table("subject_test.txt")
    sTrain <- read.table("subject_train.txt")
    feat <- read.table("features.txt")
    act_labels <- read.table("activity_labels.txt")
    
    # Combining both (train and test) datasets into one.
    X <- rbind(xTrain, xTest)
    Y <- rbind(yTrain, yTest)
    S <- rbind(sTrain,sTest)
    
    # Renaming the columns using the features file information.
    colnames(X) = feat[,2]
    
    # Subsetting the data to the mean or std columns.
    xMeanStd <- X[,grep( "mean|std", colnames(X))]
    
    # Joining the activities described in each row (Y) with their name (act_labels).
    actNames <- inner_join(Y,act_labels)
    
    # Adding extra columns to the dataset with the name of the activity represented on each row and the subjectID ...
    xMeanStd <- mutate(xMeanStd, activity = actNames[,2])
    xMeanStd <- mutate(xMeanStd, subjectID = S[,1])
    
    # ... and setting it as the first two columns.
    xMeanStd <- xMeanStd[ ,c( length(xMeanStd)-1,length(xMeanStd),1:(length(xMeanStd)-2)) ]
    
    # Creating the step 5 table with summarized tidy data.
    summarizedX <- xMeanStd %>% group_by(subjectID,activity) %>% summarize_each(funs(mean))
    
    # Writing the resulting table to a text file.
    write.table(summarizedX, row.names = FALSE, file = "tidy_data.txt")
    
    
}