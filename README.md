==================================================================
Getting and Cleaning Data Course Project
Version 1.0
==================================================================
blacayo
Coursera Course
==================================================================

For this exercise we use the data provided in the project within:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The purpose is to take this data and then subset, summarize, reshape and merge the data sets Train and Test into just one meeting the criteria specified in the exercise:

"You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."


The dataset includes the following files:
=========================================

- 'README.txt'

- 'CodeBook.md': describes the variables, the data, and any transformations or work performed to clean up the data .

- 'run_analysis.R': R file containing all of the scripts and code utilized to manipulate the data and get to the final result.

- 'data_final.txt': text file containing the final data set that matches the criteria mentioned above.

- 'FeatureLabels.txt' : text file containing the label descriptions of all of the column variables utilized to develop the final data set



The dataset source files that were used:
=========================================
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.



Notes toward the data source files: 
=========================================
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
