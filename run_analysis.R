#libraries
library(dplyr)

#set your own working directory
#setwd("your directory goes here. then uncomment the line")

## Downloading the data
#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#destfile <- "getdata_projectfiles_UCI HAR Dataset.zip"
#if (!file.exists(destfile)){
#    download.file(url, destfile = destfile, method = "curl")
#    downloadtime <- date()
#  }
#unzip(destfile)

#setwd("UCI HAR Dataset/")

## Reading files

# file /test/X_test.txt
testdata <- read.table("./test/X_test.txt", header = FALSE)
# file /test/subject_test.txt
testsubj <- read.table("./test/subject_test.txt", header = FALSE)
# file /test/y_test.txt
testlabl <- read.table("./test/y_test.txt", header = FALSE)
# file /train/X_train.txt
traindata <- read.table("./train/X_train.txt", header = FALSE)
#file /train/subject_train.txt
trainsubj <- read.table("./train/subject_train.txt", header = FALSE)
#file /train/y_train.txt
trainlabl <- read.table("./train/y_train.txt", header = FALSE)

## 1. Merges the training and the test sets to create one data set.

#adding the label and the subject to each measurement
testdata <- cbind(testdata, testsubj, testlabl)
traindata <- cbind(traindata, trainsubj, trainlabl)

#putting all data together
mydata <- rbind(testdata, traindata)

## 2. Extracts only the measurements on the mean and standard deviation
##    for each measurement.

#getting feature names from /features.txt to use as variable names
features <- read.table("./features.txt", header = FALSE)
myvars <- grep(".*-mean.*|.*-std().*", features[,2])

#add last two columns (subj and label)

myvars <- c(myvars, 562, 563)
mydata <- mydata[,myvars]

## 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("./activity_labels.txt", header = FALSE)
mydata[,81] <- activities[mydata[,81],2]

## 4. Appropriately labels the data set with descriptive variable names.

#getting feature names
variables <- features[grep(".*-mean.*|.*-std().*", features[,2]), 2]

#transforming them in descriptive names
variables <- as.character(variables)
variables <- tolower(variables)
variables <- sub("\\()", "", variables)
variables <- sub("^f", "frequencydomain-", variables)
variables <- sub("^t", "timedomain-", variables)
variables <- sub("bodybody", "body", variables)
variables <- sub("body", "body-", variables)
variables <- sub("gravity", "gravity-", variables)
variables <- sub("gyro", "gyroscope-", variables)
variables <- sub("acc", "accelerometer-", variables)
variables <- sub("jerk", "jerk-", variables)
variables <- sub("mag", "magnitude-", variables)
variables <- sub("--", "-", variables)
variables <- sub("meanfreq", "meanfrequency", variables)
variables <- sub("-x$", "-xaxis", variables)
variables <- sub("-y$", "-yaxis", variables)
variables <- sub("-z$", "-zaxis", variables)
variables <- sub("std", "standarddeviation", variables)

#adding 2 more column names
variables <- c(variables, "subject", "activity")

#naming the data
names(mydata) <- variables

## 5. From the data set in step 4, creates a second,
##    independent tidy data set with the average of
##    each variable for each activity and each subject.

#grouping and summarizing data
cleandata <- mydata %>%
  group_by(subject, activity) %>%
  summarize_all(list(mean))

#cleaning workspace
rm(activities,
   features,
   mydata,
   testdata,
   testlabl,
   testsubj,
   traindata,
   trainlabl,
   trainsubj,
   destfile,
   myvars,
   url,
   variables)

#showing and storing the result
View(cleandata)
#setwd("..")
write.table(cleandata, "tidydata.txt")
