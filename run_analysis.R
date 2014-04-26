## Description of the code

## 
# Assignment:
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Support Information
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Data exploration scripts
testPath <- "./WearableComputing/UCI HAR Dataset/test/Inertial Signals/"
trainPath <- "./WearableComputing/UCI HAR Dataset/train/Inertial Signals/"
bodyAccTest <- read.fwf(file = paste(testPath, "body_acc_x_test.txt", sep = ""), widths = rep(16, 30))
bodyAccTrain <- read.fwf(file = paste(trainPath, "body_acc_x_train.txt", sep = ""), widths = rep(16, 30))

names(bodyAccTrain)

## 1. Merges the training and the test sets to create one data set.

xTest <- read.fwf(file = "./WearableComputing/UCI HAR Dataset/test/X_test.txt", widths = rep(16, 30))
yTest <- read.fwf(file = "./WearableComputing/UCI HAR Dataset/test/y_test.txt", widths = c(1))
xTest$ActivityCode <- yTest$V1
xTest$ObservationType <- as.factor("Test")

xTrain <- read.fwf(file = "./WearableComputing/UCI HAR Dataset/train/X_train.txt", widths = rep(16, 30))
yTrain <- read.fwf(file = "./WearableComputing/UCI HAR Dataset/train/y_train.txt", widths = c(1))
xTrain$ActivityCode <- yTrain$V1
xTrain$ObservationType <- as.factor("Train")

mSet <- rbind(xTest, xTrain)

# Check the columns of the merged dataset
# names(mSet)

# Check all values between -1 and 1
# summary(mSet)



## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 





