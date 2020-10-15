# 1. Merge the training and test sets into one data set (STEP 1)
        
        # 1.1  Read in the variable(column) names from features.txt
        feats <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
        
        # 1.2 Read in the actual activity names from activity_labels.txt
        act_lab <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names = c("ID","Activity"))

        # 1.3 Build the complete "Training" data-set
                
                # Read the training data in
                training_dat <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names = feats$V2) #(STEP 4)
                
                # Read the training labels in
                train_lab_dat <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names = "Activity ID")
                
                # Read the training subject data in
                train_sub_dat <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names = "Subject ID")
                
                # Merge the three training data sets
                comb_training_dat <- cbind(train_sub_dat, train_lab_dat,training_dat)
        
        # 1.4 Build the complete "Test" data-set
        
                # Read the test data in
                test_dat <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names = feats$V2) #(STEP 4)
                
                # Read the test subject data in
                test_lab_dat <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names = "Activity ID")
                
                # Read the test subject data in
                test_sub_dat <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names = "Subject ID")
                
                # Merge the three test data sets
                comb_test_dat <- cbind(test_sub_dat,test_lab_dat,test_dat)
                
        # 1.5 Merge both complete data sets
        complete_data_set <- rbind(comb_test_dat,comb_training_dat)
        
        # 1.6 Add meaningful description of activity names, based on "activity_labels.txt"
        complete_data_set <- merge(complete_data_set,act_lab, by.x = "Activity.ID", by.y = "ID",all = TRUE) #(STEP 3)
        
        # 1.7 Re-order columns so that the activity description is alongside the Activity ID
        complete_data_set <- complete_data_set[c(2, 1,564,3:563)]
        
        # 1.8 Drop column containting the Activity ID as this is no longer needed and is unclear re: the concept of tidy data
        complete_data_set$Activity.ID <- NULL
        
# 2. Extract the measurements on the mean and standard deviation for each measurement (STEP 2)
        
        # 2.1 Subset the data, to return only the columns that relate to the mean and standard deviation, but ensuring to include the Subject ID and the Activity
        mean_sd <- complete_data_set[, grepl("std()|mean()|Subject\\.ID|Activity", colnames(complete_data_set))]
        
# 3. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
        
        # 3.1 Initiate the reshape2 package
        library(reshape2)
        
        # 3.2 Load the column names into dataframe, utilising grep to exclude the variables we want to summarize on. 
        var_col_names <- grep("std()|mean()", colnames(mean_sd))
        
        # 3.4 Melt the data into groups
        melted_data <- melt(mean_sd, id=c("Subject.ID", "Activity"),measure.vars= var_col_names)
        
        #3.5 Re-cast the data to summarize the data by Activity and Subject
        tidy_data <- dcast(melted_data, Activity + Subject.ID ~ variable, mean)
        
# 4. Pipe the tidy data out into a new file
        write.table(tidy_data, file = "atidydataset.txt")
        
        
        
        