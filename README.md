# Getting and Cleaning Data - Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, 
to prepare a tidy data that can be used for later analysis.

The repository contains the following files:

1. `README.md`, this file, which provides an overview of the data set and how it was created.
2. `tidy_data.txt`, which contains the data set.
3. `CodeBook.md`, the code book, which describes the contents of the data set.
4. `run_analysis.R`, the R script that was used to create the data set.

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Steps in the run_analysis.R script  

#STEP 1. MERGES the training and test data to create one data set.

	# First: Reading files.

		# A: reading training data:
		# B: reading testing data:
		# C: reading features:
		# D: reading activity:

	# Second: Column names.

# STEP 2.EXTRACTS the mean and standard deviation for each measurement.

	# First: reading column names:
	# Second: create vector for defining ID for mean and standard deviation:
	# Third: making a subset from setAllInOne.

# STEP 3. Uses descriptive activity names to name the activities in the data set

# STEP 4. Labels the data set with descriptive variable names.

	# For this step see the results of: STEP 1-Third, STEP 2-second and STEP 2 Third 


# STEP 5. From the data set in step 4, creates a second, independent tidy data 
#set with the average of each variable for each activity and each subject.

	#First:  make a second tidy data set.
	#Second Writing second tidy data set in txt file