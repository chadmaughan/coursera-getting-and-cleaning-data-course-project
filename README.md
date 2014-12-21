Course Project: Getting and Cleaning Data (2014-12)
====================================================

## Installation
* Checkout this repository (note the location where cloned)
* Download the data to the cloned repository path (from previous step): https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip the data with default options
`unzip getdata-projectfiles-UCI HAR Dataset.zip`

Data directory structure should look like this now (only shown 2 levels deep): 
```
UCI HAR Dataset
├── README.txt
├── activity_labels.txt
├── features.txt
├── features_info.txt
├── test
└── train
```

## Dependencies
The script `run_analysis.R` depends on the libraries `plyr` and `dplyr`. The script will install the packages if not already available.

## Analysis
* Source the script from your R environment: `source("run_analysis.R")`
* Produces a file with the tidy data at `averages.txt`

## Codebook
Information about the datasets is provided in `CodeBook.md`