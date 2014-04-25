setwd("G:\\Projects\\R\\Getting_Cleaning")
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive activity names. 
#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#The explanation is as important as the script, so make sure you have the readme
#have you combined the training and test x and y into one block, given them headings, and turned the numeric activities into something easier to read.
#have you extracted some variables to do with mean and standard deviation from the full set
#have you explained what those variables are and your criteria for picking them in the readme
#have you gotten the average of each variable for each combination of subject and activity and saved the data frame of this as a set of tidy data
#have you loaded up your current script, an up to date readme! and your tidy data
test_x_url <- "data\\UCI HAR Dataset\\test\\X_test.txt"
test_y_url <- "data\\UCI HAR Dataset\\test\\y_test.txt"

train_x_url <- "data\\UCI HAR Dataset\\train\\X_train.txt"
train_y_url <- "data\\UCI HAR Dataset\\train\\y_train.txt"

#testXFile <- read.table(test_x_url)
#testYFile <- read.table(test_y_url)
#test_bind <- cbind(testXFile,testYFile)

trainXFile <- read.table(train_x_url)
trainYFile <- read.table(train_y_url)
train_bind <- cbind(trainXFile,trainYFile)

test_subject <- read.table("data\\UCI HAR Dataset\\test\\subject_test.txt")

features <- read.table("data\\UCI HAR Dataset\\features.txt")
names(train_bind) <- features[,2]
#print(intersect(names(testXFile), names(mer)))