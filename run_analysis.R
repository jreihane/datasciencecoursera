#setwd("G:\\Projects\\R\\Getting_Cleaning")
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive activity names. 
#Creates a second, independent tidy data set with the average of each variable for
# each activity and each subject. 

#***************************************1************************************************
# load data
test_x_url <- "data\\UCI HAR Dataset\\test\\X_test.txt"
test_y_url <- "data\\UCI HAR Dataset\\test\\y_test.txt"

train_x_url <- "data\\UCI HAR Dataset\\train\\X_train.txt"
train_y_url <- "data\\UCI HAR Dataset\\train\\y_train.txt"

test_subject_url <- "data\\UCI HAR Dataset\\test\\subject_test.txt"
train_subject_url <- "data\\UCI HAR Dataset\\train\\subject_train.txt"

activity_label_url <- "data\\UCI HAR Dataset\\activity_labels.txt"
features_url <- "data\\UCI HAR Dataset\\features.txt"

testXFile <- read.table(test_x_url) #,header=FALSE, check.names=FALSE
testYFile <- read.table(test_y_url)
test_bind <- cbind(testXFile,testYFile)

test_subject <- read.table(test_subject_url,header=FALSE, check.names=FALSE)
test_bind <- cbind(test_bind,test_subject)

trainXFile <- read.table(train_x_url)
trainYFile <- read.table(train_y_url)
train_bind <- cbind(trainXFile,trainYFile)

train_subject <- read.table(train_subject_url)
train_bind <- cbind(train_bind,train_subject)
#****************************************************************************************


#**************************************2*************************************************
# add headers
features <- read.table(features_url)
names(test_bind)[1:561] = as.character(features[,2])
names(test_bind)[562] <- "Activity"
names(test_bind)[563] <- "Subjectid"

names(train_bind)[1:561] = as.character(features[,2])
names(train_bind)[562] <- "Activity"
names(train_bind)[563] <- "Subjectid"
#****************************************************************************************


#************************************3***************************************************
# merge two data sets
combined <- rbind(test_bind, train_bind)
#****************************************************************************************


#***********************************4****************************************************
# extract measurements on the mean and standard deviation for each measurement
measurments_mean <- grep("mean\\(\\)",names(combined),value=TRUE)
measurments_std <- grep("std\\(\\)",names(combined),value=TRUE)
measurements <- c(measurments_mean, measurments_std, "Activity", "Subjectid")
combined_measured <- combined[,measurements]
#****************************************************************************************


#*********************************5******************************************************
# get the average of each variable for each combination of subject and activity
splitted_by_s_a <- split(x = combined_measured,f = list(combined_measured$Activity, combined_measured$Subjectid), drop = TRUE)
col_means <- sapply(splitted_by_s_a,colMeans)
final_means <- t(col_means)
#****************************************************************************************


#**********************************6*****************************************************
# replace activity numbers
activity_names <- read.table(activity_label_url)
names(activity_names) <- c("Activityid","Activity")
combined_with_activity <- merge(y = final_means, x = activity_names, by.x = "Activityid", by.y = "Activity", all=FALSE)
#****************************************************************************************


#*********************************7******************************************************
#save tiny dataset
write.table(combined_with_activity, file="tinyDataset.txt", append=FALSE, row.names=FALSE, col.names=FALSE)
frame_tidy <- data.frame(combined_with_activity,row.names=NULL)
#****************************************************************************************



