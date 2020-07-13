library(dplyr)

# Downloading and unzipping dataset

if(!file.exists("./data")){dir.create("./data")}

# Data to work:
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip",exdir="./data")


# R script run_analysis

#STEP 1. MERGES the training and test data to create one data set.

# First: Reading files.

# A: reading training data:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# B: reading testing data:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# C: reading features:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# D: reading activity:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Second: Column names.

colnames(x_train) <- features[,2]
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# Third: MERGING all data.

mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)


# STEP 2.EXTRACTS the mean and standard deviation for each measurement.

# First: reading column names:

colNames <- colnames(setAllInOne)

# Second: create vector for defining ID for mean and standard deviation:

mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

# Third: making a subset from setAllInOne.

setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]


# STEP 3. Uses descriptive activity names to name the activities in the data set

setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)


# STEP 4. Labels the data set with descriptive variable names.


# For this step see the results of: STEP 1-Third, STEP 2-second and STEP 2 Third 


# STEP 5. From the data set in step 4, creates a second, independent tidy data 
#set with the average of each variable for each activity and each subject.


#First:  make a second tidy data set.

secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

#Second Writing second tidy data set in txt file

write.table(secTidySet, "tidy_data.txt", row.name=FALSE)

