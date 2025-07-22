subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subjects <- rbind(subject_test,subject_train)
sets <- rbind(x_test, x_train)
labels <- rbind(y_test, y_train)

mdata <- cbind(subjects, labels, sets)

features <- read.table("UCI HAR Dataset/features.txt")
colnames(mdata) <- c("subject", "activity", features$V2)
mean_std<- grep("mean\\(\\)|std\\(\\)", features$V2)
cols_keep <- c(1,2,  mean_std +2)

mdata_clean <- mdata[,cols_keep]

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
mdata_clean$activity <- activity_labels[mdata_clean$activity,2]

tidy_data <- mdata_clean %>%
    group_by(subject,activity) %>%
    summarise(across(everything(),mean))