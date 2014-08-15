
# load labels
activity_labels         <- read.table("UCI HAR Dataset/activity_labels.txt", colClasses="character")
features                <- read.table("UCI HAR Dataset/features.txt", colClasses="character")[, 2]
wanted_features_index   <- grep("mean|std", features, ignore.case=TRUE)
wanted_features         <- features[wanted_features_index]

# load data frames from data table
# subject_* contains subjectID
# y_* contains activityID
# X_* contains data
subject_test    <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test          <- read.table("UCI HAR Dataset/test/X_test.txt")[, wanted_features_index]
y_test          <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train   <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train         <- read.table("UCI HAR Dataset/train/X_train.txt")[, wanted_features_index]
y_train         <- read.table("UCI HAR Dataset/train/y_train.txt")

# apply names to data frames
colnames(subject_test)  <- c("SubjectID")
colnames(X_test)        <- wanted_features
colnames(y_test)        <- c("ActivityID")

colnames(subject_train) <- c("SubjectID")
colnames(X_train)       <- wanted_features
colnames(y_train)       <- c("ActivityID")

# combining vertially of all data
subject_all     <- rbind(subject_test, subject_train)
X_all           <- rbind(X_test, X_train)
y_all           <- rbind(y_test, y_train)

# dataset which needs to be processed
data <- cbind(subject_all, y_all, X_all)

# calculate the number of columns the data/tidy has, to delete
# the duplicated columns aggregate produced.
ncols <- dim(data)[2]

# calculate the mean of data by Subject and Activity.
tidy <- aggregate(data, list(data$ActivityID, data$SubjectID), mean)
tidy <- tidy[3:ncols]

# change the class of tidy from numeric to character.
tidy <- data.frame(lapply(tidy, as.character), stringsAsFactors=FALSE)

# replace Activity ID by its corresponding strings, padded strings with spaces so that the output aligns vertically.
tidy$ActivityID <- sapply(tidy$ActivityID, function(x){sprintf("%18s",activity_labels[x,2])})

# change ActivityID's name into Activity
colnames(tidy)[2] <- c("Activity")

# write tidy to a text file called tidy.txt
write.table(tidy, file = "tidy.txt", row.names = FALSE, sep = "\t\t\t")

# for testing if file tidy.txt is readable
# tt <- read.table('tidy.txt')
