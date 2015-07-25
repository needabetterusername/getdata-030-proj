# Data Set Code Book
This code book describes the variables, the data, and transformations performed relating to the provided data set.

##File format
The file is a text file with the following properties:

| Property | Value |
|----------|-------|
| Headers  | Yes|
| Row Names| No |
| Separator | Single space|
| Encoding | Unicode (UTF-8) |
| Line Feed Type | Unix |

Each observation is a single line in the file.

##Data Format

Each line in the file contains a single observation. Each observation is the set of average measurements for an acivity type and subject. The format is:

|Column Name | Type | Content|
|---------|------|---------|
|Activity | Char | The type of activity performed when the data was interpreted. Has of of the following values <ul><li>WALKING</li><li>WALKING\_UPSTAIRS</li><li>WALKING\_DOWNSTAIRS</li><li>SITTING</li><li>STANDING</li><li>LAYING</li>|
|Subject | Integer | Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. |
|{1:66} | Numeric (float) | A series of 66 values giving the mean of a single measurement for that activity and subject. The order of measurements is given below. For all measurements the mean() and std() values are given in that order. For directional measurements, these are given in the order X, Y, Z.|

#####Order and Type of Meaurements
Directional:

* tBodyAcc()
* tGravityAcc()
* tBodyAccJerk()
* tBodyGyro()
* tBodyGyroJerk()

Scalar:

* tBodyAccMag()
* tGravityAccMag()
* tBodyAccJerkMag()
* tBodyGyroMag()
* tBodyGyroJerkMag()

Directional:

* fBodyAcc()
* fBodyAccJerk()
* fBodyGyro()

Scalar:

* fBodyAccMag()
* fBodyBodyAccJerkMag()
* fBodyBodyGyroMag()
* fBodyBodyGyroJerkMag()

##Transformation (method)
This data set was created by merging the training and test data of the original data set described in README.md. While the full, exact method can be inspected form the .R script, the below overall steps were applied to transform the data set.

Steps:

1. Extract mean() and std() measurements from both the training and test data.
2. Append supplied activity and subject groups for aggregation.
3. Aggregate mean measurements over activities and subjects.

##License and Acknowledgements:
This original data set was provided via the below research:

* <i>Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012</i>