# This script was written for the Course Project of Getting and Cleaning Data

# This script must be located one level up from the dataset, which must be 
# unzipped  keeping the directory structure in 'UCI HAR Dataset'.

# Developed in R version 3.2.2 with 'dplyr' version 0.4.3
if(!require('dplyr'))
    stop('Install package dplyr before running this script!')

# Check that all required files exist
if(!file.exists('./UCI HAR Dataset/activity_labels.txt')) 
    stop('./UCI HAR Dataset/activity_labels.txt is missing')
if(!file.exists('./UCI HAR Dataset/features.txt')) 
    stop('./UCI HAR Dataset/features.txt is missing')

if(!file.exists('./UCI HAR Dataset/train/X_train.txt'))
    stop('./UCI HAR Dataset/train/X_train.txt is missing')
if(!file.exists('./UCI HAR Dataset/train/y_train.txt'))
    stop('./UCI HAR Dataset/train/y_train.txt is missing')
if(!file.exists('./UCI HAR Dataset/train/subject_train.txt'))
    stop('./UCI HAR Dataset/train/subject_train.txt is missing')

if(!file.exists('./UCI HAR Dataset/test/X_test.txt'))
    stop('./UCI HAR Dataset/test/X_test.txt is missing')
if(!file.exists('./UCI HAR Dataset/test/y_test.txt'))
    stop('./UCI HAR Dataset/test/y_test.txt is missing')
if(!file.exists('./UCI HAR Dataset/test/subject_test.txt'))
    stop('./UCI HAR Dataset/test/subject_test.txt is missing')


# Read activities 
activities <- read.table('./UCI HAR Dataset/activity_labels.txt', sep = ' ',
                         col.names = c('id','activity'), stringsAsFactors = FALSE)

# Replace underscores (_) with blank spaces to get nicer activity names
activities$activity <- gsub('_',' ',activities$activity)


# Read features
features <- read.table('./UCI HAR Dataset/features.txt', sep = ' ',
                       col.names = c('id','feature'), stringsAsFactors = FALSE)

# Replace parenthesis with dots and commas with underscores to get nicer names
features$feature <- gsub('[()]','',features$feature)
features$feature <- gsub('\\,','_',features$feature)

# Select features indices that contain mean or std in their name
featuresMeanStd <- grep('mean|std', features$feature)


#Load the training dataset. 
training.set <- read.table('./UCI HAR Dataset/train/X_train.txt', 
                           col.names = features$feature)

# Extract only the columns with mean or std and remove training.set
training.set.meanStd <- training.set[,featuresMeanStd]
rm(training.set)

# Read the activities for the training set
training.activities <- read.table('./UCI HAR Dataset/train/y_train.txt',
                                  col.names = 'activity')

# Convert activities to factor with labels
training.activities$activity <- factor(training.activities$activity,
                                       labels = activities$activity)

# Read the subjects for the training set
training.subjects <- read.table('./UCI HAR Dataset/train/subject_train.txt',
                                col.names = 'subject')


# Apply exactly the same processing to the test dataset
# Load the test dataset. 
test.set <- read.table('./UCI HAR Dataset/test/X_test.txt', 
                       col.names = features$feature)

# Extract only the columns with mean or std and remove test.set
test.set.meanStd <- test.set[,featuresMeanStd]
rm(test.set)

# Read the activities for the test set
test.activities <- read.table('./UCI HAR Dataset/test/y_test.txt',
                              col.names = 'activity')

# Convert activities to factor with labels
test.activities$activity <- factor(test.activities$activity,
                                       labels = activities$activity)

# Read the subjects for the training set
test.subjects <- read.table('./UCI HAR Dataset/test/subject_test.txt',
                            col.names = 'subject')


# Merge both datasets, binding matching tables by row
humanActivity <- data.frame(rbind(training.subjects, test.subjects),
                            rbind(training.activities, test.activities),
                            rbind(training.set.meanStd, test.set.meanStd))


# convert to a dplyr data frame to perform the requested analysis
humanActivity_tbl <- tbl_df(humanActivity)

# Group the data frame by subject and activity
bysubjectActivity <- group_by(humanActivity, subject, activity)

# Summarize the data frame by taking the mean of each column
bysubjectActivityMean <- summarize_each(bysubjectActivity, 'mean(., na.rm = TRUE)')

# Write the output of the analysis to submit.txt
write.table(bysubjectActivityMean, file = 'submit.txt', row.names = FALSE)

