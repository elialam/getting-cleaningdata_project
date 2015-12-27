# getting-cleaningdata_project
Below is an explanation of what the the code does, step by step:

1. the code sets the directory to my working directory.
2.downloading the required data for the project
3.as the data are in zipped format, the code unzip it for further use.
4.the code changes the working directory to the folder were data are saved
5.code reads the feature.txt file and makes it as character to use later as name of different variables in the final dataframe
6.in lines 9 to 14 we read xtest and ytest  and subject_test files into R and give their columns  appropriate names.
7.in line 15 code uses "cbind" command to creates a dataframe from "test" data
8.in line 16 to 20 the code repeats the above process for training data and creates  "train" dataframe
9.in line 21 the code put the "test" and "train" data frames together with "rbind" command
10. from line 22 to 28,the code fulfils step 3 of the project which is "Using descriptive activity names to name the activities in the data set" with required adjustments.
11.lines 29 and 30 subsets the data frame only with the columns containing mean and standard deviation of the measurements(the 3rd requirement of project)
12.in lines 31 and 32 the code again merges the required columns all together to create  the data frame explained in step 4 of project.
13.lines 33 and 34 creates a final data frame which fulfils step 5 of project: "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject"
14.lines 35 and 36 set the directory to the appropriate folder and writes the final data frame as a txt file in that directory.
