# Generic data load

  # during the process we'll use R base and dplyr (for filetering) packages

require(dplyr)

  # We'll need to download the data set and extract to the working directory, then load from there
fileLink <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileLink, dest="UCI_HAR_Dataset.zip", mode="wb")  # download file to working directory
unzip ("UCI_HAR_Dataset.zip", exdir = ".") 

setwd("./UCI HAR Dataset")

  # Load each important file to the Global Environment (this may take some time, as the files are big for PC)
test_results <- read.table("./test/X_test.txt")
train_results <- read.table("./train/X_train.txt")

subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")

test_labels <- read.table("./test/y_test.txt")
train_labels <- read.table("./train/y_train.txt")

measures <- read.table("./features.txt")
measures <- as.data.frame(measures$V2)        # removing the first column
names(measures) <- "Measure"                  # renaming for easier identification
measures[] <- lapply(measures, as.character)  # convert all observations from factor to char
mlist <- as.list(measures)                    # list them

activity <- read.table("./activity_labels.txt")

# Part 1: Test results

t1_act <- as.data.frame(matrix("test", nrow = nrow(test_results), ncol = 1))
names(t1_act) <- "Activity_Type"

act_test <- inner_join(test_labels, activity) # join the two tables,to identify WHAT the participant was doing, when they were measured
act_test <- as.data.frame(act_test$V2)        # get rid of the first column
names(act_test) <- "activity"                 # renaming for easier identification

names(subject_test) <- "Participant"          # renaming for easier identification

names(test_results) <- mlist$Measure          # use them to label the columns of test results
t1 <- cbind(subject_test, act_test, t1_act, test_results) # bind the tables together

# Parts 2: Training results

t2_act <- as.data.frame(matrix("train", nrow = nrow(train_results), ncol = 1))
names(t2_act) <- "Activity_Type"

act_train <- inner_join(train_labels, activity) # join the two tables,to identify WHAT the participant was doing, when they were measured
act_train <- as.data.frame(act_train$V2)        # get rid of the first column
names(act_train) <- "activity"                  # renaming for easier identification

names(subject_train) <- "Participant"           # renaming for easier identification

names(train_results) <- mlist$Measure           # use them to label the columns of test results
t2 <- cbind(subject_train, act_train, t2_act, train_results) # bind the tables together

# Part 3: Merging
AllResults <- rbind(t1,t2)

# Part 4: Clean data & Extracting only STD and MEAN

rm(list=setdiff(ls(), "AllResults"))            # empty environment list EXCEPT the data I need (save some memory)

valid_column_names <- make.names(names=names(AllResults), unique=TRUE, allow_ = TRUE) 
names(AllResults) <- valid_column_names         # clean column names, the same column name exist multiple times

AllResults <- select(AllResults , grep("\\bParticipant\\b|activity\\b|Activity_Type\\b|mean\\b|std", colnames(AllResults))) # need to separete the two requirements = "\\b"
  # filter out only columns I need, first3 for observation id, plus the STD and MEAN variables

  # Provide new column names, for easier identification
colnames(AllResults) <- gsub("^t", "Time", colnames(AllResults))
colnames(AllResults) <- gsub("^f", "FFTransform", colnames(AllResults))
colnames(AllResults) <- gsub("Acc","Acceleration", colnames(AllResults))
colnames(AllResults) <- gsub("Mag","Magnitude", colnames(AllResults))
colnames(AllResults) <- gsub("Gyro","AngularAcceleration", colnames(AllResults))

# Part 5: Subset & finalize output

AllResults_mean <- AllResults %>% 
  group_by(Participant, activity, Activity_Type) %>% 
  summarise_all(funs(mean))                   # dplyr packeage, to average all columns

  #clean again
rm(list=setdiff(ls(), c("AllResults", "AllResults_mean"))) # empty environment list EXCEPT the data I need (save some memory)

  # Export clean data to a new folder, then empty global environment
dir.create("../UCI HAR CleanData")          # create the new directory one level above
write.table(AllResults, "../UCI HAR CleanData/AllResults.txt", row.name = FALSE) # Export to file
write.table(AllResults_mean, "../UCI HAR CleanData/AllResults_mean.txt", row.name = FALSE) # Export to file
rm(list = ls())                             # Empty workspace to free up memory

  # Once we finished, we'll open the folder for review - this should work on Windows PC
adr <- gsub("UCI HAR Dataset", "UCI HAR CleanData", getwd())
shell.exec(adr)


