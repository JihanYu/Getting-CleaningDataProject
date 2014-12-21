----------------------------------------------------------------------------------------
run_analysis.R

## Read test & train data
test_x : read the "X_test.txt" file from the directory "test"
        (this contains variables of the features)
test_y : read the "Y_test.txt" file from the directory "test"
        (this contains labels which indicate activity)
test_subject : read the "subject_test.txt" file from the directory "test"
        (this contains subject number)
test_data : combine the loaded variables in order, 
           "Subject", "Activity label", "measurement variables"
        (to make one data set which contains information about subject, activity and its features)

Training files are equivalent as above("test" -> "train")

# Merge the test & train data sets and sort the data
merge_data : simply row-bind the test(test_x) and training(train_x) data
sort_data : sort the combined data(merge_data) in the order of "Subject", then "Activity"


## Read the features of the variables and extract mean & standard deviations
features : read the "features.txt" file (this contains variable names of test_x or train_x)
mean_id or std_id : find the indices which indicate the mean and standard deviations 
                      in the features
meanstd_data : data set extract the subject No, activity No, 
                and measurements on the mean & standard deviation by indicies


## Use activity names to name the activities & label the data set with variable names
activity_label : read the "activity_labels.txt" to assign activity No for name
for loop : input the activity name according to the activity No

then assign the variable names by "colnames"


## Calculate average of each variables for each activity and each subject
dat.long : melt the subset mean & std data(meanstd_data) as the subject & activity
ave_data : then calculate the average according to the subject & activity
          this results the averaged measurements for each activity and each subject

the result data set(ave_data) is saved as the file, "result_ave.txt".
----------------------------------------------------------------------------------------
result_ave.txt
- this has the average of each variable for each activity and each subject
- 180 rows and 68 columns
- 180 Rows contain 30 subjects and each subject has 6 activities
- 68 columns contain 2 indicator(Subject & activity) and 64 variables about mean & std
