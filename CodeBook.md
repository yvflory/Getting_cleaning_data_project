# DATA DICTIONARY – SAMSUNG FITNESS WEARABLE DATA

### Procedure
The script run_analysis.R reads in the original data files (subject list, activity list and data for both test and training sessions) if the UCI HAR Dataset folder is in your working directory.  
  
**Steps**
- Test and training files are read.
- Column names for both training and test data are read from features.txt
- Only those columns are kept that contain means or standard deviations (case insensitive).
- Subject and activity identifiers are merged onto test and training sets.
- Now that common identifiers exist, both test and training sets are merged together.
- The resulting dataset now contains all measurements relating to means and standard deviations across all subjects, activities, and for both test and training sessions.
- The script iterates through each subject and each activity. For each combination of subject and activity (there are 30 * 6 = 180), a temporary subset of rows matching the combination is created. Within this set, the mean (i.e. average) of each column is calculated. All resulting values are put in a new data frame.
- By the end of these loops, a new data frame exists that contains one row per subject/activity combination, and the respective averages for each of the variables associated with that combination.
- Column names for the new data frame are taken from the original merged data frame.
- Activity levels are transformed into factors and renamed (from numbers to "Walking", etc).
- The final data frame is written into tidy\_data_set.txt in the working directory.
  
  
### Variables
**subject**  
Unique subject id from 1-30  
  
**activity**  
1 - Walking  
2 - Walking upstairs  
3 - Walking downstairs  
4 - Sitting  
5 - Standing  
6 - Lying  
  
**measurements**
Averages of the following variables from the original datasets were taken (variable names are the same in original and converted datasets). These are time and frequency domain variables; where suffixed with X, Y or Z, they are triaxial acceleration and velocity variables taken from an accelerometer and gyroscope, respectively.  
tBodyAcc-mean()-X  
tBodyAcc-mean()-Y  
tBodyAcc-mean()-Z  
tBodyAcc-std()-X  
tBodyAcc-std()-Y  
tBodyAcc-std()-Z  
tGravityAcc-mean()-X  
tGravityAcc-mean()-Y  
tGravityAcc-mean()-Z  
tGravityAcc-std()-X  
tGravityAcc-std()-Y  
tGravityAcc-std()-Z  
tBodyAccJerk-mean()-X  
tBodyAccJerk-mean()-Y  
tBodyAccJerk-mean()-Z  
tBodyAccJerk-std()-X  
tBodyAccJerk-std()-Y  
tBodyAccJerk-std()-Z  
tBodyGyro-mean()-X  
tBodyGyro-mean()-Y  
tBodyGyro-mean()-Z  
tBodyGyro-std()-X  
tBodyGyro-std()-Y  
tBodyGyro-std()-Z  
tBodyGyroJerk-mean()-X  
tBodyGyroJerk-mean()-Y  
tBodyGyroJerk-mean()-Z  
tBodyGyroJerk-std()-X  
tBodyGyroJerk-std()-Y  
tBodyGyroJerk-std()-Z  
tBodyAccMag-mean()  
tBodyAccMag-std()  
tGravityAccMag-mean()  
tGravityAccMag-std()  
tBodyAccJerkMag-mean()  
tBodyAccJerkMag-std()  
tBodyGyroMag-mean()  
tBodyGyroMag-std()  
tBodyGyroJerkMag-mean()  
tBodyGyroJerkMag-std()  
fBodyAcc-mean()-X  
fBodyAcc-mean()-Y  
fBodyAcc-mean()-Z  
fBodyAcc-std()-X  
fBodyAcc-std()-Y  
fBodyAcc-std()-Z  
fBodyAcc-meanFreq()-X  
fBodyAcc-meanFreq()-Y  
fBodyAcc-meanFreq()-Z  
fBodyAccJerk-mean()-X  
fBodyAccJerk-mean()-Y  
fBodyAccJerk-mean()-Z  
fBodyAccJerk-std()-X  
fBodyAccJerk-std()-Y  
fBodyAccJerk-std()-Z  
fBodyAccJerk-meanFreq()-X  
fBodyAccJerk-meanFreq()-Y  
fBodyAccJerk-meanFreq()-Z  
fBodyGyro-mean()-X  
fBodyGyro-mean()-Y  
fBodyGyro-mean()-Z  
fBodyGyro-std()-X  
fBodyGyro-std()-Y  
fBodyGyro-std()-Z  
fBodyGyro-meanFreq()-X  
fBodyGyro-meanFreq()-Y  
fBodyGyro-meanFreq()-Z  
fBodyAccMag-mean()  
fBodyAccMag-std()  
fBodyAccMag-meanFreq()  
fBodyBodyAccJerkMag-mean()  
fBodyBodyAccJerkMag-std()  
fBodyBodyAccJerkMag-meanFreq()  
fBodyBodyGyroMag-mean()  
fBodyBodyGyroMag-std()  
fBodyBodyGyroMag-meanFreq()  
fBodyBodyGyroJerkMag-mean()  
fBodyBodyGyroJerkMag-std()  
fBodyBodyGyroJerkMag-meanFreq()  
angle(tBodyAccMean,gravity)  
angle(tBodyAccJerkMean),gravityMean)  
angle(tBodyGyroMean,gravityMean)  
angle(tBodyGyroJerkMean,gravityMean)  
angle(X,gravityMean)  
angle(Y,gravityMean)  
angle(Z,gravityMean)  
