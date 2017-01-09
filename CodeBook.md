## Code Book
This is a code book that describes the variables, the data and relevant transformations.

### Overview
The experiments have been carried out with a group of 30 volunteers.
Each person performed six (6) activities wearing a smartphone. The smartphone captured various data about their movements.
The obtained dataset has been randomly partitioned into two (2) sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

###The analysis
The goal is to produce a tidy dataset with the average of each mean and standard deviation variable for each activity and each subject.

###The data source
* The original dataset description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###The data - files and variables
* `features.txt`: a two-column table, IDs and names of the 561 features (variables observed).
* `activity_labels.txt`: a two-column table, IDs and names for each of the 6 activities performed.

* `X_train.txt`: training data, 7352 observations of the 561 features (variables).
* `subject_train.txt`: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in `X_train.txt`.
* `y_train.txt`: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in `X_train.txt`.

* `X_test.txt`: test data, 2947 observations of the 561 features (variables).
* `subject_test.txt`: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in `X_test.txt`.
* `y_test.txt`: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in `X_test.txt`.

More information about the experiment, files and features is available in `README.txt` and `features_info.txt`.

### Data files out of scope
This analysis was performed based on the files above only, and did not use the raw signal data (the data files in the "Inertial Signals" sub-folders).

### Transformation details (script `run_analysis.R`)
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set (file `TidyDataSet.txt`) with the average of each variable for each activity and each subject.



