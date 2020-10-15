# Script Purpose

To analyse the data contained within the UCI HAR Dataset and create a single tidy dataset showing the average of each variable for each activity and each subject

# Explanation of Script Function

1. The script first reads the contents of the file 'features.txt' into a dataframe named 'feats'. This file contains the variable names for the measurements in the data-set.

2. The script then reads the contents of the file 'activity_labels.txt' into a dataframe named 'act_lab'. This file contains the actual names of the activities, mapped to the activity ID.

3. The script then combines the 'training' and 'test' data sets. It initially creates a 'complete' 'training' data set and a 'complete' 'test' data set. It does this as follows:

   3.1. Reads in the 'training' and 'test' data sets into data frames named 'training_dat' and 'test_dat' respectively and utilises the 'feats' dataframe to add column names to the data set to ensure tidy data principles are followed.
   
   3.2. Reads in the activity IDs contained within 'y_train.txt' and 'y_test.txt' data sets into dataframes named 'train_lab_dat' and 'test_lab_dat' respectively. The column name 'Activity ID' is added to ensure tidy data principles are followed.
   
   3.3. Reads in the subject IDs contained within 'subject_train.txt' and 'subject_test.txt' data sets into dataframes named 'train_sub_dat' and 'test_sub_dat' respectively. The column name 'Subject ID' is added to ensure tidy data principles are followed.
   
   3.4. Now all components of both the individual 'training' and 'test' data sets have been read in, the script combines the three data frames using 'cbind' to produce two new dataframes named 'comb_training_dat' and 'comb_test_dat' representing all data associated with 'training' data and 'test' respectively. 
   
   3.5. The script then appends the observations in the consolidated 'training' dataframe to the observations in the consolidated 'test' dataframe using 'rbind' to create a single dataset representing both the 'training' and 'test' data. This single dataset is named 'complete_data_set'.
   
4. In the interests of creating tidy data, the script merges 'complete_data_set' dataframe with the 'act_lab' dataframe, which contains the actual names of the activities. This merge is carried out by mapping the 'Activity.ID' in the 'act_lab' dataframe with the 'ID' in the 'complete_data_set' data frame. This merge updates the 'compelete_data_set' and adding a meaningful description of the activity.

5. Now we have added the activity description, the script removes the 'Activity.ID' variable, as it is no longer required, and does not adhere to the princples of tidy data.

6. The script re-orders the variables, such that 'Subject.ID' and 'Activity' are together and to the left of the measurements.

7. The script then subsets the 'complete_data_set' utilizing grepl and a reqular expression to return the 'Subject.ID', the 'Activity' and all variables that relate to either a mean or standard deviation measurement. The grepl search is performed on the column names, which are collected using 'colnames(complete_data_set)'.

8. Using the 'reshape2' package, the script reshapes the data to ensure that each variable forms one column and each observation forms a row. This is necessary as the data contained multiple observations for 'Subject.ID / Activity' pairs.
   
   8.1. The script first loads the column names into a dataframe, exluding the variables that are to be used to produce groups ('Subject.ID' & 'Activity'). Again, this is performed using grep and regular expressions.
   
   8.2. The script then utilses 'melt' to group the data by 'Subject.ID' and 'Activity' and specifies the columns to be considered as measurements. The result is added to a data frame named 'melted_data'.
   
   8.3. The 'melted_data' is then 're-cast' using 'dcast' to summarize the data by 'Activity' and 'Subject.ID'. The mean of the measurements is taken. The result is added to a dataframe named 'tidy_data'.
   
9. We now have a tidy data set, and the script writes this data to a file called 'atidydataset.txt' in the working directory.  
