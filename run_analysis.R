TidyData<-function(){
        ##Assigns the URL were the project dataset is to a variable named url, to be used later as a variable to other f(x)s
       url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
       
       ##Downloads the Zip file into the work directory under a file with the name "20Dataset.zip"
       download.file(url,destfile = "20Dataset.zip",mode = "wb")
       
       ##Unzips the zip file into the work directory keeping the original file and folder structure
       unzip("20Dataset.zip")
       
       ##Read test file into a temp variable as data frame in order to prepare for dataset merge
                data_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
                ##Read test file Subjects in order to keep a record on the test file of the subjects the rows relate to
                data_test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
                ##Read test file activities in order to keep a record on the test file of the activities the rows relate to
                data_test_activity<-read.table("./UCI HAR Dataset/test/y_test.txt")
       
               ##Merges the data_test file with the Subjects and Activities to have it all within a single file  to prepare for merge
                data_test<-cbind(data_test,data_test_Activity,data_test_subject)
     
       ##Read train file into a temp variable as data frame in order to prepare for dataset merge
               data_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
                ##Read train file Subjects in order to keep a record on the train file of the subjects the rows relate to
               data_train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
               ##Read train file activities in order to keep a record on the train file of the activities the rows relate to
               data_train_activity<-read.table("./UCI HAR Dataset/train/y_train.txt")
       
               ##Merges the data_train file with the Subjects and Activities to have it all within a single file  to prepare for merge
               data_train<-cbind(data_train,data_train_activity,data_train_subject)
       
       ##Move the data_train data.frame to a data_merge data.frame variable in order to then merge the two data.frames test/train
       data_merge<-data_train
       
       ##Merge the two data.frames data_test and data_train into a data.frame called data_merge
       ##Moved the data_train first to data_merge as it is the longest to reduce some work from the rbind as passing the shortest to bind
       data_merge<-rbind(data_merge,data_test)
       
       ##Read column label names file to be used to add to the data_merge file
       data_merge_labels<-read.table("./UCI HAR Dataset/FeatureLabels.txt",sep = ",")
       ##Convert the labels data frame into a vector in order to set the labels as column names via the colnames function
       data_merge_labels<-as.vector(as.matrix(data_merge_labels))
       
       ##Sets the column names of the data_merge data.frame
       for (i in 1:563) {
               colnames(data_merge)[i]<-data_merge_labels[i]
       }
       
       ##Read activity descriptive names to the activity_name data set to later use with the data_merge data frame
       activity_name<-read.table("./UCI HAR Dataset/activity_labels.txt")
       ##Sets the column names for the activity_name data frame
       colnames(activity_name)[1]<-"Activity ID"
       colnames(activity_name)[2]<-"Activity Description"
       
       ##Adds the activity descriptive names to the data_merge data set to later just have the actual descriptive values vs the id
       data_merge <- merge(data_merge,activity_name,by="Activity ID")
       
       ##Subsets data_merge data frame to select only mean and standard deviation columns and adds to filter_data_merge data.frame
       ##Selection of columns was done by checking which were the columns with variables that had these values
       filter_data_merge<-subset(data_merge,select = c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543,563,564))
      
       ##Takes the filtered data frame and creates the new grouped data frame with the mean calculation by column
       ##data_final<- ddply(filter_data_merge, .("Volunteer Subject ID","Activity ID"),numcolwise(mean))
       
       ##Extracts the final data set into a txt file to then be loaded for the project work
       ##write.table(data_final, "data_final.txt", sep="\t",row.names= FALSE)
       
       
}