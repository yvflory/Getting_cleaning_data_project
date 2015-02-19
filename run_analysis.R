run_analysis <- function() {
    
    require(dplyr)
    
    ## read in variable names
    variables <- read.table("UCI HAR Dataset/features.txt")
    var_vector <- as.vector(variables[,2])
    
    ## read in test tables
    test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
    test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
    test_activity <- read.table("UCI HAR Dataset/test/Y_test.txt")
    
    ## set colnames for test files
    colnames(test_data) <- var_vector
    colnames(test_subject) <- "subject"
    colnames(test_activity) <- "activity"
    
    ## extract only variables that contain mean and std values
    test_means <- test_data[,grepl("mean|std", colnames(test_data))]
    
    ## combine all test files
    test_all <- cbind(test_subject, test_activity, test_means)
    
    ## read in train tables
    train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
    train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
    train_activity <- read.table("UCI HAR Dataset/train/Y_train.txt")
    
    ## set colnames for train files
    colnames(train_data) <- var_vector
    colnames(train_subject) <- "subject"
    colnames(train_activity) <- "activity"
    
    ## extract only variables that contain mean and std values
    train_means <- train_data[,grepl("mean|std", colnames(train_data), ignore.case = TRUE)]
    
    ## combine all test files
    train_all <- cbind(train_subject, train_activity, train_means)
    
    ## combine the two test and training datasets
    data_all <- merge(test_all, train_all, all = TRUE)
    
    data_filtered <- group_by(data_all,subject,activity)
    
    ## Calculate means for each subject and activity
    means <- summarise_each(data_filtered,funs(mean))
    
    ## turn activity variable into factors with descriptive levels
    means$activity <- factor(means$activity)
    levels(means$activity) <- list("Walking" = "1",
                                       "Walking upstairs" = "2", 
                                       "Walking downstairs" = "3",
                                       "Sitting" = "4",
                                       "Standing" = "5",
                                       "Lying" = "6")
    
    ## no renaming of variables necessary, as names are taken from features.txt
    ## As far as I could see, the erroneous duplicate column names were
    ## among those that were dropped.
    
    ## write final table into text file
    write.table(means, file = "tidy_data_set.txt", row.names = FALSE)
    
    
    
    
}