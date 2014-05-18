## READ ME FOR THE GETTING AND CLEANING PROJECT
===============================================

## Data Set Abstract
Human Activity Recognition database built from the recordings of 30 subjects performing
activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded
inertial sensors.

## Raw Dataset Information
No transformation was done on the raw dataset. The data was used as is in the Script.

The experiments have been carried out with a group of 30 volunteers within an age bracket
of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING
DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have
been video-recorded to label the data manually. The obtained dataset has been randomly
partitioned into two sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128
readings/window). The sensor acceleration signal, which has gravitational and body motion
components, was separated using a Butterworth low-pass filter into body acceleration and
gravity. The gravitational force is assumed to have only low frequency components,
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of
features was obtained by calculating variables from the time and frequency domain. 

##Data Attribute Information
For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* 10299 instance based on 30 users and 6 activities
* Its activity label. 
* An identifier of the subject who carried out the experiment.
* Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##How to run the scripts 
There is only script that needs to be executed and that script does not require any parameters to be run.
The script is run_analysis.R

##High level description of the script
Detailed information is available in the CodeBook.md

High Level steps
* Merges the training and the test sets to create one data set.
* Extracts selected columns of measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive activity names. 
*Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
