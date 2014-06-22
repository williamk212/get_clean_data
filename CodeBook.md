### CodeBook for tidy data set
This is the code book for tidy data set with the average of each variable for each activity and each subject

The data is 1 space character delimited.

### Operation
This section describes how the tidy data for averages of each activity and subject ID was derived.

1. Train data - read data files: train/subject_train.txt, train/y_train.txt, train/X_train.txt
2. column bind training data in read order: subject, y, X
..* subject file contains subject ID
..* y file contains the activity_labels ID
..* x file contains 561 of features measured
3. Test data - read data files: test/subject_test.txt, test/y_test.txt, train/X_test.txt
4. column bind test data in read order: subject, y, X
..* subject file contains subject ID
..* y file contains the activity_labels ID
..* x file contains 561 of features measured
5. Merge both train and test data set; row combine
6. efe

### Data dictionary
SUBJECT_ID: 
* description: ID of test subject
* type: integer ranging from 1 to 30.
* source: "UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/test/subject_test.txt"

ACTIVITY_LABEL_NAME:
* description: activity names. there should be six
* type: integer ranging from 1 to 30.
* source: "subject_train.txt", "subject_test.txt"

tBodyAcc-mean()-X:
* description: activity names. there should be six
* type: integer ranging from 1 to 30.
* source: "subject_train.txt", "subject_test.txt"

tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z 
tBodyAccJerk-mean()-X 
tBodyAccJerk-mean()-Y 
tBodyAccJerk-mean()-Z 
tBodyGyro-mean()-X 
tBodyGyro-mean()-Y 
tBodyGyro-mean()-Z 
tBodyGyroJerk-mean()-X 
tBodyGyroJerk-mean()-Y 
tBodyGyroJerk-mean()-Z 
tBodyAccMag-mean() 
tGravityAccMag-mean() 
tBodyAccJerkMag-mean() 
tBodyGyroMag-mean() 
tBodyGyroJerkMag-mean() 
fBodyAcc-mean()-X 
fBodyAcc-mean()-Y 
fBodyAcc-mean()-Z 
fBodyAccJerk-mean()-X 
fBodyAccJerk-mean()-Y 
fBodyAccJerk-mean()-Z 
fBodyGyro-mean()-X 
fBodyGyro-mean()-Y 
fBodyGyro-mean()-Z 
fBodyAccMag-mean() 
fBodyBodyAccJerkMag-mean() 
fBodyBodyGyroMag-mean() 
fBodyBodyGyroJerkMag-mean() 
tBodyAcc-std()-X 
tBodyAcc-std()-Y 
tBodyAcc-std()-Z 
tGravityAcc-std()-X 
tGravityAcc-std()-Y 
tGravityAcc-std()-Z 
tBodyAccJerk-std()-X 
tBodyAccJerk-std()-Y 
tBodyAccJerk-std()-Z 
tBodyGyro-std()-X 
tBodyGyro-std()-Y 
tBodyGyro-std()-Z 
tBodyGyroJerk-std()-X 
tBodyGyroJerk-std()-Y 
tBodyGyroJerk-std()-Z 
tBodyAccMag-std() 
tGravityAccMag-std() 
tBodyAccJerkMag-std() 
tBodyGyroMag-std() 
tBodyGyroJerkMag-std() 
fBodyAcc-std()-X 
fBodyAcc-std()-Y 
fBodyAcc-std()-Z 
fBodyAccJerk-std()-X 
fBodyAccJerk-std()-Y 
fBodyAccJerk-std()-Z 
fBodyGyro-std()-X 
fBodyGyro-std()-Y 
fBodyGyro-std()-Z 
fBodyAccMag-std() 
fBodyBodyAccJerkMag-std() 
fBodyBodyGyroMag-std() 
fBodyBodyGyroJerkMag-std()
