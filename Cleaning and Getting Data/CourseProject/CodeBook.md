#CodeBook for Course Project

###Input
* 2 folders Train and Test
  * In each folder, 3 files
    * subject_test, contains subject ids
    * X_test, contains measurement
    * y_test, contains activity label
* feature names list file
* activity_labels file

###1st action - Importing/Binding/Combining
* Binding subject ids, activity label and mesurements to one table for Train/Test set
* Combining Train/Test sets into one table

###2nd action - Column names
* From input's feature names list, assigend these names to data table
* Transformed minus signs into underscore
* Removed brackets from names

###3rd action - Subsetting only Mean/STD
* Using a logical vector of column names that contains either mean or std
* subset the table using this vector

###4th action - Changing from label id to label name
* Using activity_labels file, switched the ids to label names in subsetted table

###5th action - Group by and averaging
* Using dplyr library, grouped by subject and label variables and performed mean
  over all remaining columns in table

###Output
* Subsetted data grouped by subject and label which contains all Mean/STD variables


  