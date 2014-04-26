setwd("G:\\Projects\\R\\Getting_Cleaning")
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive activity names. 
#Creates a second, independent tidy data set with the average of each variable for
# each activity and each subject. 

#The explanation is as important as the script, so make sure you have the readme
#have you combined the training and test x and y into one block, given them headings,
# and turned the numeric activities into something easier to read.
#have you extracted some variables to do with mean and standard deviation from the full set
#have you explained what those variables are and your criteria for picking them in the readme
#have you gotten the average of each variable for each combination of subject and activity 
# and saved the data frame of this as a set of tidy data
#have you loaded up your current script, an up to date readme! and your tidy data

convertActivityNames <- function(){
  #combined2[combined2$Activity == activity_names2[,1],"Activity"] <- activity_names2[,2]
  split_by_activity$Activity = activity_names[split_by_activity$Activity,2]
}
# load data
test_x_url <- "data\\UCI HAR Dataset\\test\\X_test.txt"
test_y_url <- "data\\UCI HAR Dataset\\test\\y_test.txt"

train_x_url <- "data\\UCI HAR Dataset\\train\\X_train.txt"
train_y_url <- "data\\UCI HAR Dataset\\train\\y_train.txt"

test_subject_url <- "data\\UCI HAR Dataset\\test\\subject_test.txt"
train_subject_url <- "data\\UCI HAR Dataset\\train\\subject_train.txt"

activity_label_url <- "data\\UCI HAR Dataset\\activity_labels.txt"

testXFile <- read.table(test_x_url)
testYFile <- read.table(test_y_url)
test_bind <- cbind(testXFile,testYFile)

test_subject <- read.table(test_subject_url)
test_bind <- cbind(test_bind,test_subject)


#trainXFile <- read.table(train_x_url)
#trainYFile <- read.table(train_y_url)
#train_bind <- cbind(trainXFile,trainYFile)

#train_subject <- read.table(train_subject_url)
#train_bind <- cbind(train_bind,train_subject)
#print(names(trainYFile))
#names(trainXFile)

# add headers
features <- read.table("data\\UCI HAR Dataset\\features.txt")
names(test_bind)[1:561] <- features[,2]
names(test_bind)[562] <- "Activity"
names(test_bind)[563] <- "Subjectid"
#names(train_bind) <- features[,2]
#print(features[,2])
#print(test_bind$activity)
#print(head(test_bind))
#print(tail(names(test_bind)))
# merge two data sets
combined <- test_bind #rbind(test_bind, train_bind)

# replace activity numbers
activity_names <- read.table(activity_label_url)
#print(activity_names)
#split_by_activity <- split(combined,f=combined$Activity)
#print(split_by_activity[1][1])
#ccc <- combined$Activity[(combined$Activity == activity_names[,1])]
#sapply(combined$Activity, function(activity_names,combined) activity_names[combined$Activity,1], combined=combined)
#sapply(split_by_activity,FUN=convertActivityNames)
#print(head(ccc))
#for(i in activity_names){
 # dd <- combined[(combined$Activity == activity_names[i,1]),]
  #combined$Activity[(combined$Activity == activity_names[i,1]),] <- activity_names[i,2]
  #print(dd)
  #combined[(combined$Activity == activity_names[i,1]),"Activity"] <- activity_names[i,2]
#}

#print(attr(split_by_activity, "levels"))
#combined[activity_names[,1]] <- activity_names[,2]
#sapply(combined,FUN=convertActivityNames)
#print(head(combined[combined$Activity == activity_names[,2],]))

m <- merge(y = combined, x = activity_names, by.x = "V1", by.y = "Activity")
print(head(combined))


