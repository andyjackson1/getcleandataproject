# The Data

The data is from the UCI HAR Dataset, which is available at the following location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data relates to data collected from the accelerometers from the Samsung Galaxy S smartphone. The data was collected for an experiment to analyse the Human Activity Reconition using smart phones.

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The dataset contains the following files:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

# Data Utilised for this Analysis

The following files were used for the purpose of this analysis:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt'

# Variables used for this Analysis

The following variables were used for this analysis:

- Subject ID (from "subject_train.txt" & "subject_test.txt")  - This is the collection of IDs of the individuals that participated in the original study.
- Activity ID (from "y_train.txt" & "y_test.txt") - This is the collection of Activity IDs that relate to the 6 types of activity measured in the original study (1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING).
- Activity Descriptions (from "activity_labels.txt) - This is the collection of activity descriptions that relate to the Activity IDs.
- Feature Description (from "features.txt") - This is the collection of feature descriptions that relate to the measurement variables.
- Mean and Standard Deviation Measurement Variables (from "x_test.txt" and "x_train.txt") - These are the variables that contain "mean" or "sd" in the variable name.

# Data Transformations

In order to get the data into a tidy format compatible with the tidy data priciples, the follow transformations were applied to the data to produce the final output:

1. The measurement variables were given descriptive names based on the data from "features.txt"
2. The Activity ID was mapped to the descriptive activity names "1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING" and the numeric Activity ID removed from the data.
3. The final dataset was tidied by grouping by "Activity" and "Subject ID" to remove the existance of multiple observations for the same Subject/Activity pair and calculting the mean value.
