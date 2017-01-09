# load required packages

# library(reshape2)
library(data.table)
library(dplyr)

# load data sets - Activities and Features
dtActivityLabels <- fread("./UCI HAR Dataset/activity_labels.txt" , col.names = c("ActivityID","ActivityName") )
dtFeatures <- fread("./UCI HAR Dataset/features.txt" , col.names = c("FeatureID","FeatureName") )

# extract the column names for the mean and standard deviation
vFeatureIDs <- grep( "mean|std" , dtFeatures$FeatureName )
vFeatureNames <- dtFeatures$FeatureName[vFeatureIDs]

# loading and labeling data sets - Training
dtTrainingActivities <- fread("./UCI HAR Dataset/train/y_train.txt" , col.names = "ActivityID" )
dtTrainingSubjects <- fread("./UCI HAR Dataset/train/subject_train.txt" , col.names = "SubjectID" )
dtTrainingMeasurements <- fread("./UCI HAR Dataset/train/X_train.txt" , col.names = vFeatureNames , select = vFeatureIDs )

# loading and labeling data sets - Test
dtTestActivities <- fread("./UCI HAR Dataset/test/y_test.txt" , col.names = "ActivityID" )
dtTestSubjects <- fread("./UCI HAR Dataset/test/subject_test.txt" , col.names = "SubjectID" )
dtTestMeasurements <- fread("./UCI HAR Dataset/test/X_test.txt" , col.names = vFeatureNames , select = vFeatureIDs )

# naming the activities in Training and Test
dtTrainingActivities[ , ActivityName:= dtActivityLabels$ActivityName[ActivityID]  ]
dtTestActivities[ , ActivityName:= dtActivityLabels$ActivityName[ActivityID] ]

# creating one data set
dtTrainingMergedData <- bind_cols( dtTrainingSubjects , dtTrainingActivities , dtTrainingMeasurements )
dtTestMergedData <- bind_cols( dtTestSubjects , dtTestActivities , dtTestMeasurements )

dtCombinedData <- bind_rows( dtTrainingMergedData , dtTestMergedData )

# creating a second, independent tidy data set with the average of each variable for each activity and each subject

dtMeltData <- melt( dtCombinedData ,  id.vars=c("SubjectID","ActivityName") , measure.vars=vFeatureNames )
dtTidyData <- dcast( dtMeltData ,  SubjectID + ActivityName ~ variable, mean )

write.table( dtTidyData , file="TidyDataSet.txt"  , row.names=FALSE )

# end
