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
#testPath <- "./WearableComputing/UCI HAR Dataset/test/Inertial Signals/"
#trainPath <- "./WearableComputing/UCI HAR Dataset/train/Inertial Signals/"
#bodyAccTest <- read.fwf(file = paste(testPath, "body_acc_x_test.txt", sep = ""), widths = rep(16, 30))
#bodyAccTrain <- read.fwf(file = paste(trainPath, "body_acc_x_train.txt", sep = ""), widths = rep(16, 30))

#names(xTest)


#?data.table

#xTest <- read.table(file = "./WearableComputing/UCI HAR Dataset/test/X_test.txt")

## 1. Merges the training and the test sets to create one data set.
library(data.table)

#xTest <- read.fwf(file = "./WearableComputing/UCI HAR Dataset/test/X_test.txt", widths = rep(16, 561))
#yTest <- read.fwf(file = "./WearableComputing/UCI HAR Dataset/test/y_test.txt", widths = c(1))
#sTest <- read.fwf(file = "./WearableComputing/UCI HAR Dataset/test/subject_test.txt", widths = c(1))
xTest <- read.table(file = "./WearableComputing/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table(file = "./WearableComputing/UCI HAR Dataset/test/y_test.txt")
sTest <- read.table(file = "./WearableComputing/UCI HAR Dataset/test/subject_test.txt")
xTest$ActivityCode <- yTest$V1
xTest$ObservationType <- as.factor("Test")
xTest$SubjectCode <- sTest$V1

#xTrain <- read.fwf(file = "./WearableComputing/UCI HAR Dataset/train/X_train.txt", widths = rep(16, 30))
#yTrain <- read.fwf(file = "./WearableComputing/UCI HAR Dataset/train/y_train.txt", widths = c(1))
#sTrain <- read.fwf(file = "./WearableComputing/UCI HAR Dataset/train/subject_train.txt", widths = c(1))
xTrain <- read.table(file = "./WearableComputing/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table(file = "./WearableComputing/UCI HAR Dataset/train/y_train.txt")
sTrain <- read.table(file = "./WearableComputing/UCI HAR Dataset/train/subject_train.txt")
xTrain$ActivityCode <- yTrain$V1
xTrain$ObservationType <- as.factor("Train")
xTrain$SubjectCode <- sTrain$V1

# Merged dataset
mSet <- rbind(xTest, xTrain)

# Check the columns of the merged dataset
# names(mSet)

# Check all values between -1 and 1
# summary(mSet)



## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# Read feature set
feat <- read.table(file = "./WearableComputing/UCI HAR Dataset/features.txt")

# Getting mean and stddev columns
library(sqldf)

measIdx <- sqldf("select * from feat where V2 like '%mean()%' or V2 like '%std()%'")[, 1]

# Dataset with only mean and standard deviation measurements
fSet <- mSet[, measIdx]


## 3. Uses descriptive activity names to name the activities in the data set

# Load activity descriptive names
activityLabels <- read.table(file = "./WearableComputing/UCI HAR Dataset/activity_labels.txt")

# Creating ActivityLabels variable with the descriptive names
fSet$ActivityLabels <- merge(mSet, activityLabels, by.x = "ActivityCode", by.y = "V1")[, "V2.y"]


## 4. Appropriately labels the data set with descriptive activity names.
# Naming headers for the data set
names(fSet) <- c(as.character(feat[measIdx, 2]), "ActivityLabels")

# Savind the tidy data set
head(fSet)

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.









