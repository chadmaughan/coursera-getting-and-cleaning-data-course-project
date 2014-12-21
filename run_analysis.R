#
# Course Project from "Getting and Cleaning Data"
#   2014-12-21
#
# For more information, see: 
#   https://class.coursera.org/getdata-016/human_grading/view/courses/973758/assessments/3/submissions
#
# Steps
# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names. 
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# 0a - install the required packages
if (!require("plyr", character.only=TRUE)) {
  install.packages("plyr")
}
library("plyr")

if (!require("dplyr", character.only=TRUE)) {
  install.packages("dplyr")
}
library("dplyr")

# 0b - set the working directory to match that of this script
setwd(dirname(parent.frame(2)$ofile))

# 1 - Merges the training and the test sets to create one data set.
#   read data in (expects extracted files to be in path: ./UCI HAR Dataset)
print("Step 1, merging training and test sets")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# combine the data sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(s_train, s_test)

# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
print("Step 2, extracting measurements")
features <- read.table("./UCI HAR Dataset/features.txt")
mean_and_std_only <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_and_std_only]
names(x_data) <- features[mean_and_std_only, 2]

# 3 - Uses descriptive activity names to name the activities in the data set
print("Step 3, using activity names")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

# 4 - Appropriately labels the data set with descriptive variable names. 
print("Step 4, label the combined data")
names(s_data) <- "subject"
all_data <- cbind(x_data, y_data, s_data)

# 5 - From the data set in step 4, creates a second, independent tidy data set with the 
#       average of each variable for each activity and each subject.
print("Step 5, create tidy data")
averages_data <- ddply(.data = all_data, .variables = .(subject, activity), .fun = 
                       function(x) {
                          colMeans(x[, 1:66])
                       })
write.table(averages_data, "averages.txt", row.name=FALSE)