## Read test & train data, then merge them to create one data set
# read test set, labels & subject, then make overall test data
test_x <- read.table("./test\\X_test.txt")
test_y <- read.table("./test\\Y_test.txt")
test_subject <- read.table("./test\\subject_test.txt")
test_data <- cbind(test_subject, test_y, test_x)
# read train set, labels & subject, then make overall train data
train_x <- read.table("./train\\X_train.txt")
train_y <- read.table("./train\\Y_train.txt")
train_subject <- read.table("./train\\subject_train.txt")
train_data <- cbind(train_subject, train_y, train_x)
# Merge the test & train data sets
merge_data <- rbind(test_data, train_data)
# sort the merged data set (1st : subject / 2nd : activity labels)
sort_data <- merge_data[order(merge_data[[1]], merge_data[[2]]),]

## Extracts only the measurements on the mean & standard deviation
features <- read.table("features.txt", stringsAsFactors = FALSE)
mean_id <- which(grepl("mean()", features[[2]], fixed=TRUE))
std_id <- which(grepl("std()", features[[2]], fixed=TRUE))
meanstd_id <- sort(union(mean_id, std_id))
meanstd_data <- sort_data[,c(1, 2, (meanstd_id+2))]

## Use activity names to name the activities
activity_label <- read.table("activity_labels.txt", stringsAsFactors=FALSE)

for(i in c(1:6)){
	meanstd_data[which(meanstd_data[[2]]==i),][[2]] <- activity_label[[2]][i]
}

## Labels the data set with variable names
colnames(meanstd_data) <- c("Subject", "Activity", features[[2]][meanstd_id])

## Result dataset(ave_data) with the average of each variable
##    for each activity and each subject
library(reshape2)
dat.long <- melt(meanstd_data, id.var=c("Subject", "Activity"),
		 variable.name="variable", value.name="score")
ave_data <- dcast(dat.long, Subject+Activity ~ variable, mean, 
		  value.var="score")
write.table(ave_data, "result_ave.txt", sep=" ", row.names=FALSE)

