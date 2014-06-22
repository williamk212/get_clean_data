## Getting and Cleaning Data - Peer Assignment
by Will Keung

### Introduction
This is a peer assignment for class, Getting and Cleaning Data.
https://class.coursera.org/getdata-004/human_grading

The requirements for this program to run is to have the required raw data set exploded on the same directory that the source file is located at.
The raw data set can be retrieved from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Instructions
To run: 
```R
source("run_analysis.R")
review_data <- main()
```
After running the program, the return of the main function is a tidy data set with the required columns. This tidy data set has merged data from both training and test cases and certain column filtered out. 
**NOTE!** This tidy data set is **NOT** the answer to step 5 of the assignment.

There should be two files written:
1. The basic tidy data set - return of main(). file: wearable_computing_DT-basic_tidy_data.txt
2. The independent tidy data set with the average of each variable for each activity and each subject. file: wearable_computing_DT-average_tidy_data.txt

