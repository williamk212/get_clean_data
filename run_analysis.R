# Class: Getting and Cleaning Data
# URL: https://class.coursera.org/getdata-004
#
# @author: William Keung
# email: williamk212 [at] gmail [dot] com
#
# run_analysis
#
main <- function() {
  library(data.table)
  library(reshape2)
  raw_merged_data <- read_data_files_merge()
  raw_merged_data_DT <- data.table(raw_merged_data)
  merged_data_header_DT <- label_header(raw_merged_data_DT)
  
  filter_col_indices <- get_filter_column_indices(merged_data_header_DT)
  # obtain only required columns: mean(), std()
  filtered_data_DT <- merged_data_header_DT[,filter_col_indices, with=FALSE]
  setkey(filtered_data_DT, ACTIVITY_LABEL_ID)

  # This should give us the data in an expected and organized fashion. 
  # should meet the following requirements:
  # 1. Merges the training and the test sets to create one data set.
  # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  # 3. Uses descriptive activity names to name the activities in the data set
  # 4. Appropriately labels the data set with descriptive variable names.
  wearable_computing_DT <- merge_activity_label(filtered_data_DT)
  
  basic_tidy_file <- "./wearable_computing_DT-basic_tidy_data.txt"
  write.table(wearable_computing_DT, basic_tidy_file, row.names = FALSE)
  
  # Now let's reshape data to get average of each variable for 
  # each activity and each subject.
  mean_std_cols <- get_mean_std_col(wearable_computing_DT)
  wearable_computing_DT_melt <- melt(wearable_computing_DT, 
                                     id=c("SUBJECT_ID", "ACTIVITY_LABEL_NAME"), 
                                     measure.vars=mean_std_cols)
  subject_activity_avg <- dcast(wearable_computing_DT_melt, 
                                SUBJECT_ID+ACTIVITY_LABEL_NAME ~ variable,mean)
  average_tidy_file <- "./wearable_computing_DT-average_tidy_data.txt"
  write.table(subject_activity_avg, average_tidy_file, row.names = FALSE)
  wearable_computing_DT_melt
}

merge_activity_label <- function(data_table_set) {
  activity_label_file <- "./UCI HAR Dataset/activity_labels.txt"
  activity_labels <- read_ref_table(activity_label_file, 
                                   names = c("ACTIVITY_LABEL_ID", "ACTIVITY_LABEL_NAME"))
  activity_labels <- transform(activity_labels, 
                               ACTIVITY_LABEL_NAME = as.character(ACTIVITY_LABEL_NAME))
  activity_labels_DT <- data.table(activity_labels)
  setkey(activity_labels_DT, ACTIVITY_LABEL_ID)
  activity_col_join <- merge(data_table_set, activity_labels_DT, 
                             by="ACTIVITY_LABEL_ID")
  col_join <- activity_col_join
  # expect to have column length to be 69
  # if so, then rearrange columns
  if (ncol(activity_col_join) == 69) {
    col_join <- activity_col_join[, c(1, 2, 69, 3:68), with=FALSE]
  } else {
    print(paste("warning: did not expect ncol for activity_col_join: ", 
                ncol(activity_col_join)))
  }
  col_join
}

## This function calculates the mean of activity data set based on:
## subject_id and activity_name
get_mean_subject_activity <- function(data_table_set, subject_id, activity_name, 
                                      field_name) {
  subset_DT <- data_table_set[(data_table_set$SUBJECT_ID==subject_id & 
                              data_table_set$ACTIVITY_LABEL_NAME==activity_name),]
  subset_field <- subset_DT[[field_name]]
  mean(subset_field)
}

## function will obtain vector of required columns
get_filter_column_indices <- function(data_set) {
  mean_std_cols <- get_mean_std_col(data_set)
  # make sure we grab the first two columns also
  filter_col_indices <- c("SUBJECT_ID", "ACTIVITY_LABEL_ID", mean_std_cols)
}

get_mean_std_col <- function(data_set) {
  mean_cols <- grep(".*-mean\\(\\).*", colnames(data_set), value = TRUE)
  std_cols <- grep(".*-std\\(\\).*", colnames(data_set), value = TRUE)
  c(mean_cols, std_cols)
}

## This function will set the name of all the header names in
## the whole data set
label_header <- function(data_set) {
  feature_label <- read_ref_table("./UCI HAR Dataset/features.txt")
  all_data_header <- c(c("SUBJECT_ID", "ACTIVITY_LABEL_ID"), 
                       as.character(feature_label$NAME))
  if (length(colnames(data_set)) != length(all_data_header)) {
    stop("# of columns of data_set doesn't match read headers") 
  }
  setnames(data_set, all_data_header)
  data_set
}

read_ref_table <- function(table_file, names = c("ID", "NAME")) {
  reference_table <- read.csv(table_file, header = FALSE, sep=" ", 
                              col.names=names)
}

read_data_files_merge <- function() {
  subject_file <- "./UCI HAR Dataset/train/subject_train.txt"
  y_file <- "./UCI HAR Dataset/train/y_train.txt"
  x_file <- "./UCI HAR Dataset/train/X_train.txt"
  train_data <- read_files_combine(subject_file, y_file, x_file)
  
  subject_file <- "./UCI HAR Dataset/test/subject_test.txt"
  y_file <- "./UCI HAR Dataset/test/y_test.txt"
  x_file <- "./UCI HAR Dataset/test/X_test.txt"
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
