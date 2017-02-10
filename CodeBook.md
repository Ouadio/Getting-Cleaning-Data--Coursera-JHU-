#Code Book
This document describes the code inside run_analysis.R

##Overview
Source of the original raw Data: 

* Code book: [CodeBook](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)      

* Data file: [Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

Data sets used in this project:
* 'train/X_train.txt': *Training set.*

* 'train/y_train.txt': *Training labels.*

* 'test/X_test.txt': *Test set.*

* 'test/y_test.txt': *Test labels.*

* 'features.txt': *List of all features.*

* 'activity_labels.txt': *Links the class labels with their activity name.*

* 'train/subject_train.txt': *Rows identifie the subject who performed the activity [1-30].*


The code in run_analysis.R can be described as a 4-steps code (the script is splitted by comments):

1. Loading and preparing the required data

2. Extracting only the enteries storing the mean or standard deviation for each measurement

3. Merging training and test data to create a first Tidy Dataset

4. Creating a second tidy data set with the average of each Variable for each Activity and each Subject

##Code parts explicitly:
####1- Loading and preparing the required data
*10-17:* Loading the required datasets and storing them in variables

####2- Extracting only the enteries storing the mean or standard deviation for each measurement
*22:* deleting the numbers in the features vector (irrelevant for the study)
*23-24:* selecting the indexes of the features mentionning a mean or standard deviation in the features vector
*29:* extracting only the columns of the training dataset corresponding the the mean/standard deviation of the measurements
*30:* attributing the corresponding features' names to the columns of the obtained train data

*31-32:* joining the corresponding subjects and activity columns to the obtained train data
*36-39:* same as 29-32 applied to the test dataset

*42-43:* by default the subjects and activity values are stored as factors. Turning them into characters.

####3- Merging training and test data to create a first Tidy Dataset

*48:* merging the train and test with **rbind()** in one dataset stored in *total*
*52-53:* cleaning the activity labels and attributing them to activity column of *total*
*54-57:* cleaning the names of the *total* variables 
*58:* storing the obtained Tidy data in the *total0* table

####4- Creating a second tidy data set with the average of each Variable for each Activity and each Subject

*63:* creating a new variable within *total* dataset: Subj_Acty=pairs of (subject, activity) separated with "_". The idea is that grouping along two variables is equivalent to grouping allong the variable that contains all the combinations of the these two variables. 
*64:* grouping the *total* data along the *Subj_Acty* variable using **group_by()**

*65:* calculating the average (mean) of all the columns for each pair (subject,activity) using **summarise_each()**

*72:* separating the two variables (subject & activity) stored in the Subj_Acty to turn it into a tidy data: 180 observation= (30 Subject)*(6 Activity)

*76-77:* arranging the obtained tidy data and creating a .txt file version of it using **write.table()**


##About the variables:
The variable names (the features' labels) have been modified to be more descriptive and clear.

* Subject: The subjects who performed the activity [1-30]

* Activity: The 6 activities performed in the experience

The features variables' names are combinations of the following words:

* Time: Time domain signals

* Freq: Frequency domain signals

* Acc: Acceleration signal

* Gyro: Gyroscope signal

* Mean: Average of the mean for a specific subject and specific activity

* SD: Average of the Standard Deviation for a specific subject and specific activity

* Jerk: Jerk signals obtained by derivation in time 

* Mag: Magnitude of the signal calculated using the Euclidean norm

* XYZ: X, Y or Z Axis

* Gravity: Gravity component of the signal

* Body: Body component of the signal



