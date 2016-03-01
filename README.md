# GACD-Project
Getting and Cleaning Data - Project

##Output:
###combined_data
Combination of training and test datasets, but only includes columns corresponding to mean and standard deviation values.
###dfAverages
Data frame of the average of each of the numeric fields in combined_data by subject and activity

##Process:
####Create table of Activity Types
####Create table of table features (row headings)
####Load X_TRAIN.TXT, Y_TRAIN.TXT, SUBJECT_TRAIN.TXT, X_TEST.TXT, Y_test.TXT, SUBJECT_TEST.TXT
####Assemble Training Set - Combining the three TRAIN files
####Assemble Test set - Combining the three TEST files
####Combine Data - Stack Training Set and Test Set
####Create Averages by Subject and Activity


#Makes use of the Following Files:
##activity_labels.txt
Codes for the 6 Activity Types

##features.txt
Column headings for the train and test datasets

##X_test.txt
Contains the measurements that make up the test dataset

##y_test.txt
Identifies which activity corresponds with an entry in X_test

##subject_test.txt
Identifies which subject corresponds with an entry in X_test

##X_train.txt
Contains the measurements that make up the train dataset

##y_train.txt
Identifies which activity corresponds with an entry in X_train

##subject_train.txt
Identifies which subject corresponds with an entry in X_train

