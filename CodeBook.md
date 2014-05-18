## CODE BOOK FOR THE GETTING AND CLEANING PROJECT
===============================================

##Variables
Sensor Signals
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

##Summary Choices
Choice 1: Replaced the numeric activity labels with the following labels
1 to WALKING
2 to WALKING_UPSTAIRS
3 to WALKING_DOWNSTAIRS
4 to SITTING
5 to STANDING
6 to LAYING

Choice 2 and Choice 3:
A decision was made to select from the 561 feature vector the columns that
contain the Mean and Standard Deviation (STD) as they relate to axial measurement 
i.e. X, Y, Z. The remaining columns were discarted from further processing.
In addition the selected columns name were renamed as follows. 
Example: from tBodyAcc-mean()-X to Body Acc mean X
Remaining column names
* "Body Acc mean X"
* "Body Acc mean Y"
* "Body Acc mean Z"
* "Body Acc std X"
* "Body Acc std Y"
* "Body Acc std Z"
* "Gravity Acc mean X"
* "Gravity Acc mean Y"
* "Gravity Acc mean Z"
* "Gravity Acc std X"
* "Gravity Acc std Y"
* "Gravity Acc std Z"
* "Body Acc Jerk mean X"
* "Body Acc Jerk mean Y"
* "Body Acc Jerk mean Z"
* "Body Acc Jerk std X"
* "Body Acc Jerk std Y"
* "Body Acc Jerk std Z"
* "Body Gyro mean X"
* "Body Gyro mean Y"
* "Body Gyro mean Z"
* "Body Gyro std X"
* "Body Gyro std Y"
* "Body Gyro std Z"
* "Body Gyro Jerk mean X"
* "Body Gyro Jerk mean Y"
* "Body Gyro Jerk mean Z"
* "Body Gyro Jerk std X"
* "Body Gyro Jerk std Y"
* "Body Gyro Jerk std Z"
* "fBody Acc mean X"
* "fBody Acc mean Y"
* "fBody Acc mean Z"
* "fBody Acc std X"
* "fBody Acc std Y"
* "fBody Acc std Z"
* "fBody Acc Jerk mean X"
* "fBody Acc Jerk mean Y"
* "fBody Acc Jerk mean Z"
* "fBody Acc Jerk std X"
* "fBody Acc Jerk std Y"
* "fBody Acc Jerk std Z"
* "fBody Gyro mean X"
* "fBody Gyro mean Y"
* "fBody Gyro mean Z"
* "fBody Gyro std X"
* "fBody Gyro std Y"
* "fBody Gyro std Z"
* "User"
* "Activity"

##Detailed Script Instruction 
There are 10 steps in the run-analysis.R script
1. Step 1 No transformation. Each train data set was read.
2. Step 2 No transformation. Each train data set was combined.
3. Step 3 No transformation. Each test data set was read.
4. Step 4 No transformation. Each test data set was combined.
5. Step 5 No transformation. Merged Train and Test Data Set together.
6. Step 6 Transformed numeric activity number labels to descriptive activity names as per Choice 1. No transformation was done on the data.
7. Step 7 Transformed by selecting a subset of the 561 variables according to Choice 2 and 3.
8. Step8 Transformed chosen columns names with more appropriate labels as per Choice 2 and 3. No transformation was done on the data.
9. Step 9 Several mathematical transformations were conducted.
* First Calculated the Mean of each Mean column for each row.
* Second Calculated Mean of each STD column for each row.
* Third Calculated Mean of each column aggregated by user then by activity
* Fourth Created a new table of that resulted in 180 rows (30 users by 6 activity) and 4 columns (User, Activity, Mean of Means,Mean of STD)
10. Step 10 Created a tab delimited text file called: newdataanalysis.txt

##Experimental Study Design 
This outlines the transformation if any applied at each step of the script.

1. Step 1 Train Data Sets (X_train, subject_train, y_train) was read 
2. Step 2 Consolidated the Train Data Set into one
3. Step 3 Test Data Sets (X_test, subject_test, y_test) was read 
4. Step 4 Consolidated the Test Data Set into one
5. Step 5 Merge Train and Test Data Set together
6. Step 6 Replaced numeric activity numbers with descriptive activity names
7. Step 7 Selected a subset of columns as detailed in Summary Choices section for further processing.
8. Step8 Replaced chosen columns names with more appropriate labels.
9. Step 9 has multiple steps in the creation of a second independent tidy data set with the average of each variable for each activity and each subject. 
* First Calculate Mean of each Mean column for each row
* Second Calculate Mean of each STD column for each row
* Third Calculate Mean of each column by user by activity
* Fourth Create a new table of that has 180 rows (30 users by 6 activity) and 4 columns (User, Activity, Mean of Means,Mean of STD)
10. Step 10 Write dataframe to Tab delimited file called: newdataanalysis.txt