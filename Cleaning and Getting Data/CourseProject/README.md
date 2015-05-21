# README.me for Course Project

### 1st step - Merges the training and the test sets to create one data set.
* Loaded Train/Test values/labels/subject txt files into temp variables
* Used cbind() to combine these values/labels/subject variables into one table
* Did it both for train/test data
* Finally, used rbind() to create a completed table with both train/test tables

####Additional steps:
* Removing temp variables
* Reading feature names list from txt file
* **Removing brackets and replaceing minus signs using gsub() function**
* Adding these names to the completed table

### 2nd step - Extracts only the measurements on the mean and standard deviation for each measurement. 
* Created a logical vector that says whether each column contains "mean"/"std"
  * Going over all columns was done using sapply() function
  * The search on the column string was done using the grepl() function
* Changed the value for the first two columns (subject and label) so they'll appear also in the data
* Created a new sub-table(MSset variable) using the logical vector

### 3rd step - Uses descriptive activity names to name the activities in the data set
* Using the switch function, transfomed each code (1 to 6) into the descriptive name

### 4th step - Appropriately labels the data set with descriptive variable names. 
* Done on step 1, under additional steps, marked as bold

### 5th step - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
#####Using dplyr library
* Performed group by on necessary columns
* Used summarise_each function to go over all columns and cacluate their means
* Assigned it to output variable OutputSet
* Write varialbe into txt file, Output.txt
