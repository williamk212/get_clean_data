# Class: Getting and Cleaning Data
# URL: https://class.coursera.org/getdata-004
#
# @author: William Keung
# email: williamk212 [at] gmail [dot] com
#
# run_analysis
#

read_files_merge <- function() {
  subject_file <- "./UCI_HAR_Dataset/train/subject_train.txt"
  y_file <- "./UCI_HAR_Dataset/train/y_train.txt"
  x_file <- "./UCI_HAR_Dataset/train/X_train.txt"
  train_data <- read_files_combine(subject_file, y_file, x_file)
  
  subject_file <- "./UCI_HAR_Dataset/test/subject_test.txt"
  y_file <- "./UCI_HAR_Dataset/test/y_test.txt"
  x_file <- "./UCI_HAR_Dataset/test/X_test.txt"
  test_data <- read_files_combine(subject_file, y_file, x_file)
  rbind(train_data, test_data)
}

read_files_combine <- function(subject_file_url, y_file_url, 
                               x_file_url) {
  subject_data <- read.table(subject_file_url, header = FALSE)
  y_data <- read.table(y_file_url, header = FALSE)
  x_data <- read.table(x_file_url, header = FALSE)
  col_combine_data <- data.frame(subject_data, y_data, x_data)
}

