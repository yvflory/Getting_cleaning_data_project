run_analysis <- function() {
    
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
    train_means <- train_data[,grepl("mean|std", colnames(train_data))]
    
    ## combine all test files
    train_all <- cbind(train_subject, train_activity, train_means)

    ## combine the two test and training datasets
    data_all <- merge(test_all, train_all, all = TRUE)
    
    ## extract mean for each variable by activity and subject
    ## 
    ## iterate over each subject, and over each activity
    ## for each combination, calculate mean for each variable
    ## add to new df: subject - activity - means...
    mean_rows <- 30 * 6
    mean_data <- data.frame(matrix(ncol = 81, nrow = mean_rows))
    counter <- 1

    for (i in 1:30) { ## subjects
        for (j in 1:6) { ## activities
            ##temp_df is empty (bar cloumn names). Why?
            #temp_df <- subset(data_all, subject == i & activity == j)
            temp_df <- data_all[(data_all$subject == i & data_all$activity == j),]
            mean_data[counter,1] <- i
            mean_data[counter,2] <- j
            ## iterate over all (measured) variables and assign the mean
            ## of each column to the new dataframe
            for (k in 3:81) {
                mean_data[counter,k] <- mean(temp_df[1:nrow(temp_df),k])
            }
            counter <- counter + 1
        }  
    }
    ## add column names to new dataset
    colnames(mean_data) <- colnames(data_all)
    
    ## turn activity variable into factors with descriptive levels
    mean_data$activity <- factor(mean_data$activity)
    levels(mean_data$activity) <- list("Walking" = "1",
                                      "Walking upstairs" = "2", 
                                      "Walking downstairs" = "3",
                                      "Sitting" = "4",
                                      "Standing" = "5",
                                      "Lying" = "6")
    
    ## no renaming of variables necessary, as names are taken from features.txt
    ## As far as I could see, the erroneous duplicate column names were
    ## among those that were dropped.
    
    ## write final table into text file
    write.table(mean_data, file = "tidy_data.txt", row.names = FALSE)

}