
File provided for the Project in URL: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" , was downloaded into file Name "20Dataset.zip"

Downloaded file was a zip file for which it first needed to be unziped within the R program work directory in order for it to be used and the code to be the same for all users
       
There are 2 files that are used for this exercise:
X_test.txt : 
found under the test folder inside the UCI HAR Dataset folder.
Contains all of the data set information from the test population
X_train.txt : 
found under the train folder inside the UCI HAR Dataset folder.
Contains all of the data set information from the train population       

Both files are loaded into a corresponding data.frame in R to be manipulated data_test and data_train respectively.

Then in addition there is a file which contains the ID of the subjects that were part of the sample and the activities that were performed by each.  These are the following files:

subject_test.txt : 
found under the test folder inside the UCI HAR Dataset folder.
Contains the ID of the subjects that performed the activities in each row of the X_test.txt file
loaded into temp variable data_train_test
subject_train.txt : 
found under the train folder inside the UCI HAR Dataset folder.
Contains the ID of the subjects that performed the activities in each row of the X_train.txt file
loaded into temp variable data_train_subject
Y_test.txt : 
found under the test folder inside the UCI HAR Dataset folder.
Contains the ID of the activities that were performed by te subjects in each row of the X_test.txt file
loaded into temp variable data_test_activity
Y_train.txt : 
found under the train folder inside the UCI HAR Dataset folder.
Contains the ID of the activities that were performed by te subjects in each row of the X_train.txt file
loaded into temp variable data_train_activity

 Now we proceed to merge the data with the subjects and the activities using the cbind formula as they are in the same order and have the same number of rows. 

Now we need to proceed to merge the test with the train information.

We load the train inforamtion into a new variable data_merge

We merge the data_train data frame with the data_merge using the rbind column as both data sets have the same number of columns and just need to add the rest of the rows.

We then need to add the column label names to each of the columns of the data_merge variable.  

We first created a new txt file with the column names to be used, in order to make them descriptive we took the provided features.txt file provided and expanded all of the acronyms and short words using the guide provided by the features_info.txt file provided.

The new list of descriptive labels were loaded into a data.frame called data_merge_labels

In order to be able to assign these to the data_merge data.frame via the colnames function we needed to convert to a vector first, which we do by using the as.vector(as.matrix(data_merge_labels)) function

We now via a for cycle set the column names of the data_merge data.frame using the data_merge_labels labels.       

Now we have a merged data.frame with all of the column descriptive names and subjects and activities that were performed.

Now we need to replace the activity ID with the actual activity description.

for this we need to use the activity_labels.txt file which was provided and that is under the UCI HAR Dataset folder.  We load this into a data.frame activity_name

In order to be able to properly merge this with the data_merge data.frame we proceed to assign the proper column names to the activity_name data frame for the keys to be able to match and use the merge function.

Now we use the merge() with the "Activity ID" variable to merge the data_merge data.frame with the activity_name data.frame to properly add the activity descriptions to the data_merge data.frame."

Now we need to discard all of the columns that are not mean or standard deviation values.

For this we went and manually identified the columns that meat this criteria and create a list.

We used the subset() to select only these columns from the data_merge data.frame to have the almost final cleaned data requested.  We assign this to the filter_data_merge data.frame.
       
Finally it is requested to calculate the average or mean of each of the activities performed by each of the subjects in kind of a groups setup.

This is done via the ddply() and the numcolwise() functions. Which group the data.frame by a specified variable and performs an specified variable to all columns of the respective grouping.

This is stored in a new data.frame called data_final

Now we proceed with the last step which is to write this into a txt file via the write.table().