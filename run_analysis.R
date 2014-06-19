# Class: Getting and Cleaning Data
# URL: https://class.coursera.org/getdata-004
#
# @author: William Keung
# email: williamk212 [at] gmail [dot] com
#
# run_analysis
#
main <- function() {
  raw_merged_data <- read_data_files_merge()
  merged_data_header <- label_header(raw_merged_data)
}

## This function will set the name of all the header names in
## the whole data set
label_header <- function(data_set) {
  feature_label <- read_header()
  all_data_header <- c(c("SUBJECT_ID", "ACTIVITY_LABEL_ID"), 
                       as.character(feature_label$NAME))
  if (length(colnames(data_set)) != length(all_data_header)) {
    stop("# of columns of data_set doesn't match read headers") 
  }
  names(data_set) <- all_data_header
  data_set
}

read_header <- function(feature_label_file = "./UCI_HAR_Dataset/features.txt") {
  feature_labels <- read.csv(feature_label_file, header = FALSE, 
                             sep=" ", col.names=c("ID", "NAME"))
}

read_data_files_merge <- function() {
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

