## Introduction

This repository is a submission for the course project of "Getting and Cleaning Data" offered via Coursera.org by JHU.

This dataset provides the per-activity, per-subject mean values for each mean() and std() measurement provided in the the below source dataset. This data set is provided in a "wide" tidy format. Please see CodeBook.md for details on the content and format.

#### Source data set
The original dataset is processed movement data from the accelerometers of the Samsung Galaxy S smartphone. Further information on the original project and data set is available 
<a hef="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">
here</a>.

##	Files
Four files are provided with this data set:

* README.md - this file.
* CodeBook.md - the code book which explains the format and contents of the data set contained in dataset.txt.
* dataset.txt - a text file format copy of the data set.
* run_analysis.R - an R script which will re-generate the data set contained in dataset.txt when provided with the original data set.

## Reading the data set
The data set can be read from the test file with the following R command:

```{R}
dataset <- read.table("dataset.txt",
						header=TRUE,
						sep=" ",
						check.names = FALSE)
```

## Re-Generating the Data Set
First a copy of the source data set must be made available in the R working directory under the sub-folder "UCI HAR Dataset".

* <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">
Original data set provided for this course</a>

Second, source the provided .R file:

```{R}
source("run_analysis.R")
```

The dataset can now be generated in a **text file** by running the following command:

```{R}
 run_analysis()
```

To acquire a copy of the data set in a **data.frame**, run:

```{R}
 meansData <- run_analysis( writeDataset = FALSE )
```

##License and Acknowledgements:
This original data set was created via the below research:

* <i>Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012</i>