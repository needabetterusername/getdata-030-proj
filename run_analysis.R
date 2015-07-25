# Submitted for the Course Project of "Getting and Cleaning Data"
# offered on Coursera.org by JHU
# 
# Required Dataset:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# Purpose of this file:
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements of the mean ("~mean()") and 
#   standard deviation ("~std()") for each observation. 
# 3.Uses descriptive activity names to name the activities in the data set (activity_labels.txt)
# 4.Appropriately labels the data set with descriptive variable names. 
#
# 5.From the data set in step 4, creates a second, independent tidy data 
#   set with the average of each variable for each activity and each subject.


merge_data <- function(){
  
  #r man recommends use of scan() for large matrices

  #get column names and target column indicies
  colnames <- scan(file = "UCI HAR Dataset/features.txt",
                   n=561*2,
                   quiet = TRUE,
                   what=list(numeric(1),character(1))
  )
  colnames <- colnames[[2]]
  targetColumns = sort(c(grep("mean\\(",colnames),grep("std\\(",colnames)))
  
  
  
  #read measurement data  
  testData <- scan(file = "UCI HAR Dataset/test/X_test.txt", 
                   n=561*2947,
                   what=double(),
                   quiet=TRUE,
                   comment.char="")
  testData <- matrix(testData, 2947, 561, byrow=TRUE)
  colnames(testData)<-colnames
  testData <- testData[,targetColumns]
  
  trainData <- scan(file = "UCI HAR Dataset/train/X_train.txt", 
                   n=561*7352,
                   what=double(),
                   quiet=TRUE,
                   comment.char="")
  trainData <- matrix(trainData, 7352, 561, byrow=TRUE)
  colnames(trainData)<-colnames
  trainData <- trainData[,targetColumns]
  rm(colnames, targetColumns)
  
  
  
  #read and append activities
  Activity<-scan(file="UCI HAR Dataset/test/y_test.txt",
                       what=integer(1),
                       quiet=TRUE)
  testData <- cbind(testData,Activity)
  
  Activity<-scan(file="UCI HAR Dataset/train/y_train.txt",
                 what=integer(1),
                 quiet=TRUE)
  trainData <- cbind(trainData,Activity)
  rm(Activity)
  
  
  
  #read and append subjects
  Subject<-scan(file="UCI HAR Dataset/test/subject_test.txt",
                 what=integer(1),
                 quiet=TRUE)
  testData <- cbind(testData,Subject)  
  
  Subject<-scan(file="UCI HAR Dataset/train/subject_train.txt",
                what=integer(1),
                quiet=TRUE)
  trainData <- cbind(trainData,Subject)  
  rm(Subject)
  
  
  #add Test/Train types
  #1 for Test, 2 for Train
  #testData <- cbind(testData, rep(1,nrow(testData)) )
  #colnames(testData)[ncol(testData)] <- "Set"
  #trainData <-cbind(trainData, rep(2,nrow(trainData)))
  #colnames(trainData)[ncol(trainData)] <- "Set"
  
  
  
  #convert to data.frame, add factors
  harData <- rbind(testData,trainData)
  rm(testData,trainData)
  
  harData<-as.data.frame(harData)
  activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt",
                             sep = " ",
                             colClasses = c("integer","character"))
  harData$Activity<-factor(harData$Activity,activityLabels[[1]],activityLabels[[2]])
  rm(activityLabels)
  #harData$Subject <- as.factor(harData$Subject)
  #harData$Set<-factor(harData$Set,c(1,2),c("Test","Train"))
  
  return(harData)
}




# arguments:
# writeDataset: Write the data set to file or return as a variable.
# filename:     Name of the file to be written if writeDataset is TRUE
run_analysis<-function(writeToFile=TRUE,
                       filename="dataset.txt"){
  #temporary
  mergedData <- merge_data()

  #aggregate data to means
  mergedData <- aggregate(mergedData[,1:(ncol(mergedData)-2)],
                          list(Actitivy=mergedData$Activity,
                               Subject=mergedData$Subject),
                          mean)
  
  #write out data set as a txt file created with write.table() using row.name=FALSE
  if(writeToFile){
    write.table(x = mergedData,
              file = filename,
              row.names = FALSE)
  }else{
    return(mergedData)
  }
}