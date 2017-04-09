# load the training data
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
dataTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
colnames(dataTrain) <- as.character(features$V2)

# create a data frame with the training data
frameTrain <- data.frame("Subject" = subjectTrain$V1, "Activity" = activityTrain$V1,
                         dataTrain)
# load the test data
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
dataTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(dataTest) <- as.character(features$V2)

# create a data frame with the test data
frameTest <- data.frame("Subject" = subjectTest$V1, "Activity" = activityTest$V1,
                        dataTest)

# create a final data set merging the two frames
finalSet <- rbind(frameTest,frameTrain)
finalSet = finalSet[with(finalSet, order(finalSet$Subject)),]

# only keep the columns with mean and std
need <- c("mean", "std")
keep <- grepl(paste(need, collapse = "|"), colnames(finalSet),ignore.case = FALSE)
keep[1] = TRUE
keep[2] = TRUE
finalSet <- finalSet[, keep]

# change the column names into human readable names
colnames(finalSet) = gsub("fBody", "frequencyBody", colnames(finalSet))
colnames(finalSet) = gsub("tBody", "timeBody", colnames(finalSet))
colnames(finalSet) = gsub("AccJerk", "LinearJerk", colnames(finalSet))
colnames(finalSet) = gsub("GyroJerk", "AngularJerk", colnames(finalSet))
colnames(finalSet) = gsub("Acc", "Acceleration", colnames(finalSet))
colnames(finalSet) = gsub("tGravity", "timeGravity", colnames(finalSet))
#colnames(finalSet) = gsub("...", ".", colnames(finalSet))
colnames(finalSet) = gsub(".mean..", "Mean", colnames(finalSet))
colnames(finalSet) = gsub(".std..", "Std", colnames(finalSet))
colnames(finalSet) = gsub("eq\\..", "Freq", colnames(finalSet))
colnames(finalSet) = gsub("Gyro", "AngularVelocity", colnames(finalSet))
colnames(finalSet) = gsub("Mag", "Magnitude", colnames(finalSet))

# calculate the mean of each column by subjects
library(data.table)
tidyData <- finalSet[0,]
subjects <- seq(1,30)
activities <- seq(1,6)
cols <- seq(3,81)
for(subject in subjects)
{
  for(activity in activities)
  {
    row = NULL
    for(col in cols)
    {
      row = c(row, mean(finalSet[finalSet$Subject == subject & finalSet$Activity == activity,
                                 col]))
    }
    tidyData = rbindlist(list(tidyData, as.list(c(subject, activity, row))), use.names = T,
                         fill = F)
  }
}


#load the activity labels and change the numeric factors into characters
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
for(i in seq(1,6))
{
  tidyData$Activity = gsub(activityLabels$V1[i], activityLabels$V2[i], tidyData$Activity)
}

remove(dataTest)
remove(dataTrain)
remove(frameTest)
remove(frameTrain)