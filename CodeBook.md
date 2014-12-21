# Introduction

The script `run_analysis.R` performs the 5 steps described in the course project's definition.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Variables

* data from downloaded files is stored (throughout the analysis) in the variables `x_train`, `y_train`, `x_test`, `y_test`, `s_train` and `s_test`.
* merged data is stored in the variables `x_data`, `y_data` and `s_data`
* 