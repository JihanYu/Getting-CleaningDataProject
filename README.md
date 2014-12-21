Getting and Cleaning Data
Course Project

Programmed by Jihan Yu
2014-12-21

run_analysis.R
- By using the data from accelerometers from the Samsung smartphone,
   calculate the averaged mean & standard deviations for each activity and each subject
- The data should be stored in the working directory.
  But the test data is in the "/test" directory 
    and training data is in the "/training" directory
- "run_analysis.R" will read the test & training measurements
    and combine the 2 datasets into 1 data set
    then sorot the result data set in the order of "Subject", and "Activity"
  This function extracts the mean and standard deviation for each measurements 
    and assign the variable names
  With melt() and dcast() functions in the library "reshape2", 
    obtains the average of each variable for each activity and each subject
- The result data set is saved as the file name, "result_ave.txt"


result_ave.txt
- Result data set
- 180 rows X 68 columns
- 180 Rows contain 30 subjects and each subject has 6 activities
   The rows are sorted as Subject and Activity names
- 68 columns contain 2 indicator(Subject & activity) and 64 variables about mean & std


CodeBook.md 
- describes the variables, data and transformation of the "run_analysis.R" file
